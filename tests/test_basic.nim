# SPDX-License-Identifier: MIT

import
  pkg / balls, pkg / sys / ioqueue, pkg / wayland

suite "basic":
  let wl = wayland.newClient()
  let path = wayland.socketPath()
  echo "connect to ", path
  wl.connect(path)
  wl.dispatch()
  run()