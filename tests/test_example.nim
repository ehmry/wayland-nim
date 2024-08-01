# SPDX-License-Identifier: MIT

import
  pkg / sys / ioqueue, pkg / wayland

type
  TestState = ref object
    nil

type
  Display {.final.} = ref object of Wl_display
  
method error(obj: Display; object_id: Oid; code: uint; message: string) =
  raise newException(ProtocolError, message)

type
  Registry {.final.} = ref object of Wl_registry
    globals*: seq[GlobalEntry]

  GlobalEntry = object
  
method global(reg: Registry; n: uint; f: string; v: uint) =
  echo "new global at ", n, " - ", f, "-", v
  reg.globals.add GlobalEntry(face: f, name: n, version: v)

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