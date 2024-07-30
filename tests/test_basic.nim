# SPDX-License-Identifier: MIT

import
  pkg / sys / ioqueue, pkg / wayland

block:
  let wl = wayland.newClient()
  let path = wayland.socketPath()
  wl.connect(path)
  ## Client dispatching
  wl.dispatch()
  run()