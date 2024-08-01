# Nim-native Wayland client libary

*WORK-IN-PROGRESS*

Communicate with Wayland using Nim but without depending on the libwayland C library (and a janky libc, GNU deps, etc).

Project priorities in descending order:
- simplicity
- efficiency
- miminal dependency graph
- Protocol compliance

The library is built against the [sys](https://github.com/alaviss/nim-sys) I/O dispatcher and uses [continuation-Passing style](https://github.com/nim-works/cps) for asynchronicity.
The implementation is simple enough to augmented later with support for different dispatchers, should patches be forthcoming.

The library provides a [code-generator](./src/wayland/codegenerator.nim) for producing a Nim module for a given protocol document in XML.
A module for the core protocol is [provided](./src/wayland/globals.nim).

Modules generated from protocols contain object types that inherit from an abstract `Wl_object` along with associated procedures for sending requests and methods for receiving events.

To use the library one must at minimum implement the `Wl_display` object.
```nim
type
  Display {.final.} = ref object of Wl_display
    ## Inherit from the Wl_display object to get its request procedures.
    test: TestState

method error(obj: Display; object_id: Oid; code: uint; message: string) =
  ## Handler for incoming "error" events.
  raise newException(CatchableError, msg)

let reg = newRegistryImpl()
  # Provide you own registry object to access globals from the server.

display.get_registry(reg)
  # Inform the server of your registry.
  # Any further interaction will be as a result
  # of global object announcements received
  # through the registry methods you provide.

```

See the [example test](./tests/test_example.nim) for how to use the library in practice.
