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
Modules are provided for the [core protocol](./src/wayland/globals.nim) and [xdg-shell](./src/wayland/xdg_shell.nim).

Modules generated from protocols contain object types that inherit from an abstract `Wl_object` along with associated procedures for sending requests and methods for receiving events.

See the [example test](./tests/test_example.nim) for how to use the library in practice.
