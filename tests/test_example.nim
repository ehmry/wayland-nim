# SPDX-License-Identifier: MIT

import
  pkg / sys / ioqueue, pkg / wayland,
  pkg / wayland / [globals, shared_memories, xdg_shell]

const
  width = 640
  height = 480
type
  Shm {.final.} = ref object of Wl_shm
method format(shm: Shm; format: Wl_shm_format) =
  echo "wl_shm supports format ", format

type
  Compositor {.final.} = ref object of Wl_compositor
type
  WlSurface {.final.} = ref object of globals.Wl_surface
  
proc createSurface(comp: Compositor): WlSurface =
  new result
  comp.create_surface(result)

method preferred_buffer_scale(surf: WlSurface; factor: int) =
  echo "server prefers buffer scale of ", factor

type
  Wm {.final.} = ref object of Xdg_wm_base
method ping(wm: Wm; serial: uint) =
  wm.pong(serial)
  echo "ponging server"

type
  WmSurface {.final.} = ref object of Xdg_surface
  
proc getSurface(wm: Wm; surf: WlSurface): WmSurface =
  result = WmSurface(wl: surf)
  wm.get_xdg_surface(result, surf)

method configure(surf: WmSurface; serial: uint) =
  surf.ack_configure(serial)
  let buffer = surf.wl.buffer
  var pixel: uint16
  for y in 0 ..< height:
    for x in 0 ..< width:
      buffer[x, y] = pixel
      inc pixel
  surf.wl.attach(buffer, 0, 0)
  surf.wl.damage(0, 0, width, height)
  surf.wl.commit()

type
  WmToplevel {.final.} = ref object of Xdg_toplevel
proc getToplevel(surf: WmSurface): WmToplevel =
  new result
  surf.get_toplevel(result)

method wm_capabilities(toplevel: WmToplevel; ablities: seq[uint32]) =
  for abl in ablities:
    echo "WM supports ", Xdg_toplevel_wm_capabilities(abl), " for this surface"

method configure(toplevel: WmToplevel; width, height: int; states: seq[uint32]) =
  echo "toplevel surface would have dimensions", width, "x", height

method close(toplevel: WmToplevel) =
  quit()

type
  Display {.final.} = ref object of Wl_display
  
proc newDisplay(): Display =
  ## Allocate a new `Display` object.
  new result

proc isReady(disp: Display): bool =
  not (disp.comp.isNil or disp.shm.isNil or disp.wm.isNil)

proc showPattern(disp: Display) =
  let
    pool = disp.shm.createPool(width * height * 2 * 2)
    surface = disp.comp.createSurface()
    wmSurface = disp.wm.getSurface(surface)
    toplevel = wmSurface.getToplevel()
  toplevel.set_title("Nim Wayland test")
  toplevel.set_app_id("test_example")
  surface.buffer = pool.createBuffer(0, width, height, width * 2, rgb565)
  surface.commit()

type
  Registry {.final.} = ref object of Wl_registry
  
proc getRegistry(disp: Display) =
  ## Create a new `Registry` object and send it to the server.
  disp.get_registry(Registry(disp: disp))

method error(display: Display; obj: Wl_object; code: uint; message: string) =
  raise newException(ProtocolError, message)

method global(reg: Registry; name: uint; face: string; version: uint) =
  ## Handle global objects.
  echo "server announces global ", face, " v", version
  case face
  of "wl_compositor":
    assert reg.disp.comp.isNil
    new reg.disp.comp
    reg.bind(name, face, version, reg.disp.comp)
    if reg.disp.isReady:
      reg.disp.showPattern()
  of "wl_shm":
    assert reg.disp.shm.isNil
    new reg.disp.shm
    reg.bind(name, face, version, reg.disp.shm)
    if reg.disp.isReady:
      reg.disp.showPattern()
  of "xdg_wm_base":
    assert reg.disp.wm.isNil
    new reg.disp.wm
    reg.bind(name, face, version, reg.disp.wm)
    if reg.disp.isReady:
      reg.disp.showPattern()
  else:
    discard

block:
  let
    wl = wayland.newClient()
    path = wayland.socketPath()
    display = newDisplay()
  proc runner() {.asyncio.} =
    echo "connect to ", path
    wl.connect(display, path)
    display.getRegistry()
    wl.dispatch()

  runner()
  run()