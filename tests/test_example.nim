# SPDX-License-Identifier: MIT

import
  pkg / sys / ioqueue, pkg / wayland

type
  TestState = ref object
    nil

type
  Shm {.final.} = ref object of Wl_shm
method format(shm: Shm; format: Wl_shm_format) =
  echo "wl_shm format is ", format

type
  Compositor {.final.} = ref object of Wl_compositor
  
  Registry {.final.} = ref object of Wl_registry
  
method global(reg: Registry; name: uint; face: string; version: uint) =
  ## Handle global objects.
  echo "server announces global ", face, " v", version
  case face
  of "wl_compositor":
    assert reg.comp.isNil
    reg.comp = Compositor(test: reg.test)
    reg.client.bindObject(reg.comp)
    reg.bind(name, face, version, reg.comp.oid)
  of "wl_shm":
    assert reg.shm.isNil
    reg.shm = Shm()
    reg.client.bindObject(reg.shm)
    reg.bind(name, face, version, reg.shm.oid)
  else:
    discard

type
  Display {.final.} = ref object of Wl_display
  
method error(obj: Display; object_id: Oid; code: uint; message: string) =
  raise newException(ProtocolError, message)

block:
  let
    state = TestState()
    wl = wayland.newClient()
    path = wayland.socketPath()
    display = Display(test: state)
    registry = Registry(test: state)
  proc runner() {.asyncio.} =
    echo "connect to ", path
    wl.connect(display, path)
    display.get_registry(registry)
    wl.dispatch()

  runner()
  run()