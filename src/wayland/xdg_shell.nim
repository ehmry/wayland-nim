# SPDX-License-Identifier: MIT

import
  pkg / wayland / clients

import
  globals

type
  Xdg_wm_base* = ref object of Wl_object
  Xdg_wm_base_error* = enum
    `role` = 0, `defunct_surfaces` = 1, `not_the_topmost_popup` = 2,
    `invalid_popup_parent` = 3, `invalid_surface_state` = 4,
    `invalid_positioner` = 5, `unresponsive` = 6
type
  Xdg_positioner* = ref object of Wl_object
  Xdg_positioner_error* = enum
    `invalid_input` = 0
  Xdg_positioner_anchor* = enum
    `none` = 0, `top` = 1, `bottom` = 2, `left` = 3, `right` = 4,
    `top_left` = 5, `bottom_left` = 6, `top_right` = 7, `bottom_right` = 8
  Xdg_positioner_gravity* = enum
    `none` = 0, `top` = 1, `bottom` = 2, `left` = 3, `right` = 4,
    `top_left` = 5, `bottom_left` = 6, `top_right` = 7, `bottom_right` = 8
  Xdg_positioner_constraint_adjustment* = enum
    `none` = 0, `slide_x` = 1, `slide_y` = 2, `flip_x` = 4, `flip_y` = 8,
    `resize_x` = 16, `resize_y` = 32
type
  Xdg_surface* = ref object of Wl_object
  Xdg_surface_error* = enum
    `not_constructed` = 1, `already_constructed` = 2, `unconfigured_buffer` = 3,
    `invalid_serial` = 4, `invalid_size` = 5, `defunct_role_object` = 6
type
  Xdg_toplevel* = ref object of Wl_object
  Xdg_toplevel_error* = enum
    `invalid_resize_edge` = 0, `invalid_parent` = 1, `invalid_size` = 2
  Xdg_toplevel_resize_edge* = enum
    `none` = 0, `top` = 1, `bottom` = 2, `left` = 4, `top_left` = 5,
    `bottom_left` = 6, `right` = 8, `top_right` = 9, `bottom_right` = 10
  Xdg_toplevel_state* = enum
    `maximized` = 1, `fullscreen` = 2, `resizing` = 3, `activated` = 4,
    `tiled_left` = 5, `tiled_right` = 6, `tiled_top` = 7, `tiled_bottom` = 8,
    `suspended` = 9
  Xdg_toplevel_wm_capabilities* = enum
    `window_menu` = 1, `maximize` = 2, `fullscreen` = 3, `minimize` = 4
type
  Xdg_popup* = ref object of Wl_object
  Xdg_popup_error* = enum
    `invalid_grab` = 0
func face*(obj: Xdg_wm_base): string =
  "xdg_wm_base"

func version*(obj: Xdg_wm_base): uint =
  6

proc `destroy`*(obj: Xdg_wm_base) =
  request(obj, 0, ())

proc `create_positioner`*(obj: Xdg_wm_base; `id`: Xdg_positioner) =
  request(obj, 1, (`id`,))

proc `get_xdg_surface`*(obj: Xdg_wm_base; `id`: Xdg_surface;
                        `surface`: Wl_surface) =
  request(obj, 2, (`id`, `surface`))

proc `pong`*(obj: Xdg_wm_base; `serial`: uint) =
  request(obj, 3, (`serial`,))

method `ping`*(obj: Xdg_wm_base; `serial`: uint) {.base.} =
  eventNotImplemented("xdg_wm_base.ping")

method dispatchEvent*(obj: Xdg_wm_base; msg: Message) =
  case msg.opcode
  of 0:
    var args: (uint,)
    unmarshal(obj, msg, args)
    obj.`ping`(args[0])
  else:
    raise newUnknownEventError("xdg_wm_base", msg.opcode)

func face*(obj: Xdg_positioner): string =
  "xdg_positioner"

func version*(obj: Xdg_positioner): uint =
  6

proc `destroy`*(obj: Xdg_positioner) =
  request(obj, 0, ())

proc `set_size`*(obj: Xdg_positioner; `width`: int; `height`: int) =
  request(obj, 1, (`width`, `height`))

proc `set_anchor_rect`*(obj: Xdg_positioner; `x`: int; `y`: int; `width`: int;
                        `height`: int) =
  request(obj, 2, (`x`, `y`, `width`, `height`))

proc `set_anchor`*(obj: Xdg_positioner; `anchor`: Xdg_positioner_anchor) =
  request(obj, 3, (`anchor`,))

proc `set_gravity`*(obj: Xdg_positioner; `gravity`: Xdg_positioner_gravity) =
  request(obj, 4, (`gravity`,))

proc `set_constraint_adjustment`*(obj: Xdg_positioner; `constraint_adjustment`: Xdg_positioner_constraint_adjustment) =
  request(obj, 5, (`constraint_adjustment`,))

proc `set_offset`*(obj: Xdg_positioner; `x`: int; `y`: int) =
  request(obj, 6, (`x`, `y`))

proc `set_reactive`*(obj: Xdg_positioner) =
  request(obj, 7, ())

proc `set_parent_size`*(obj: Xdg_positioner; `parent_width`: int;
                        `parent_height`: int) =
  request(obj, 8, (`parent_width`, `parent_height`))

proc `set_parent_configure`*(obj: Xdg_positioner; `serial`: uint) =
  request(obj, 9, (`serial`,))

func face*(obj: Xdg_surface): string =
  "xdg_surface"

func version*(obj: Xdg_surface): uint =
  6

proc `destroy`*(obj: Xdg_surface) =
  request(obj, 0, ())

proc `get_toplevel`*(obj: Xdg_surface; `id`: Xdg_toplevel) =
  request(obj, 1, (`id`,))

proc `get_popup`*(obj: Xdg_surface; `id`: Xdg_popup; `parent`: Xdg_surface;
                  `positioner`: Xdg_positioner) =
  request(obj, 2, (`id`, `parent`, `positioner`))

proc `set_window_geometry`*(obj: Xdg_surface; `x`: int; `y`: int; `width`: int;
                            `height`: int) =
  request(obj, 3, (`x`, `y`, `width`, `height`))

proc `ack_configure`*(obj: Xdg_surface; `serial`: uint) =
  request(obj, 4, (`serial`,))

method `configure`*(obj: Xdg_surface; `serial`: uint) {.base.} =
  eventNotImplemented("xdg_surface.configure")

method dispatchEvent*(obj: Xdg_surface; msg: Message) =
  case msg.opcode
  of 0:
    var args: (uint,)
    unmarshal(obj, msg, args)
    obj.`configure`(args[0])
  else:
    raise newUnknownEventError("xdg_surface", msg.opcode)

func face*(obj: Xdg_toplevel): string =
  "xdg_toplevel"

func version*(obj: Xdg_toplevel): uint =
  6

proc `destroy`*(obj: Xdg_toplevel) =
  request(obj, 0, ())

proc `set_parent`*(obj: Xdg_toplevel; `parent`: Xdg_toplevel) =
  request(obj, 1, (`parent`,))

proc `set_title`*(obj: Xdg_toplevel; `title`: string) =
  request(obj, 2, (`title`,))

proc `set_app_id`*(obj: Xdg_toplevel; `app_id`: string) =
  request(obj, 3, (`app_id`,))

proc `show_window_menu`*(obj: Xdg_toplevel; `seat`: Wl_seat; `serial`: uint;
                         `x`: int; `y`: int) =
  request(obj, 4, (`seat`, `serial`, `x`, `y`))

proc `move`*(obj: Xdg_toplevel; `seat`: Wl_seat; `serial`: uint) =
  request(obj, 5, (`seat`, `serial`))

proc `resize`*(obj: Xdg_toplevel; `seat`: Wl_seat; `serial`: uint;
               `edges`: Xdg_toplevel_resize_edge) =
  request(obj, 6, (`seat`, `serial`, `edges`))

proc `set_max_size`*(obj: Xdg_toplevel; `width`: int; `height`: int) =
  request(obj, 7, (`width`, `height`))

proc `set_min_size`*(obj: Xdg_toplevel; `width`: int; `height`: int) =
  request(obj, 8, (`width`, `height`))

proc `set_maximized`*(obj: Xdg_toplevel) =
  request(obj, 9, ())

proc `unset_maximized`*(obj: Xdg_toplevel) =
  request(obj, 10, ())

proc `set_fullscreen`*(obj: Xdg_toplevel; `output`: Wl_output) =
  request(obj, 11, (`output`,))

proc `unset_fullscreen`*(obj: Xdg_toplevel) =
  request(obj, 12, ())

proc `set_minimized`*(obj: Xdg_toplevel) =
  request(obj, 13, ())

method `configure`*(obj: Xdg_toplevel; `width`: int; `height`: int;
                    `states`: seq[uint32]) {.base.} =
  eventNotImplemented("xdg_toplevel.configure")

method `close`*(obj: Xdg_toplevel) {.base.} =
  eventNotImplemented("xdg_toplevel.close")

method `configure_bounds`*(obj: Xdg_toplevel; `width`: int; `height`: int) {.
    base.} =
  eventNotImplemented("xdg_toplevel.configure_bounds")

method `wm_capabilities`*(obj: Xdg_toplevel; `capabilities`: seq[uint32]) {.base.} =
  eventNotImplemented("xdg_toplevel.wm_capabilities")

method dispatchEvent*(obj: Xdg_toplevel; msg: Message) =
  case msg.opcode
  of 0:
    var args: (int, int, seq[uint32])
    unmarshal(obj, msg, args)
    obj.`configure`(args[0], args[1], args[2])
  of 1:
    obj.`close`()
  of 2:
    var args: (int, int)
    unmarshal(obj, msg, args)
    obj.`configure_bounds`(args[0], args[1])
  of 3:
    var args: (seq[uint32],)
    unmarshal(obj, msg, args)
    obj.`wm_capabilities`(args[0])
  else:
    raise newUnknownEventError("xdg_toplevel", msg.opcode)

func face*(obj: Xdg_popup): string =
  "xdg_popup"

func version*(obj: Xdg_popup): uint =
  6

proc `destroy`*(obj: Xdg_popup) =
  request(obj, 0, ())

proc `grab`*(obj: Xdg_popup; `seat`: Wl_seat; `serial`: uint) =
  request(obj, 1, (`seat`, `serial`))

method `configure`*(obj: Xdg_popup; `x`: int; `y`: int; `width`: int;
                    `height`: int) {.base.} =
  eventNotImplemented("xdg_popup.configure")

method `popup_done`*(obj: Xdg_popup) {.base.} =
  eventNotImplemented("xdg_popup.popup_done")

proc `reposition`*(obj: Xdg_popup; `positioner`: Xdg_positioner; `token`: uint) =
  request(obj, 2, (`positioner`, `token`))

method `repositioned`*(obj: Xdg_popup; `token`: uint) {.base.} =
  eventNotImplemented("xdg_popup.repositioned")

method dispatchEvent*(obj: Xdg_popup; msg: Message) =
  case msg.opcode
  of 0:
    var args: (int, int, int, int)
    unmarshal(obj, msg, args)
    obj.`configure`(args[0], args[1], args[2], args[3])
  of 1:
    obj.`popup_done`()
  of 2:
    var args: (uint,)
    unmarshal(obj, msg, args)
    obj.`repositioned`(args[0])
  else:
    raise newUnknownEventError("xdg_popup", msg.opcode)
