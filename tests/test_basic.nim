# SPDX-License-Identifier: MIT

import
  pkg / sys / ioqueue, pkg / wayland

block:
  let wl = wayland.newClient()
  let path = wayland.socketPath()
  echo "connect to ", path
  wl.connect(path)
  wl.dispatch()
  run()