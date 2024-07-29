# SPDX-License-Identifier: MIT

import
  pkg / wayland / objects

type
  Wl_display_opcode* = enum
    Sync, Get_registry, Error, Delete_id
  Wl_display* = ref object of Wl_object
  Wl_registry_opcode* = enum
    Bind, Global, Global_remove
  Wl_registry* = ref object of Wl_object
  Wl_callback_opcode* = enum
    Done
  Wl_callback* = ref object of Wl_object
  Wl_compositor_opcode* = enum
    Create_surface, Create_region
  Wl_compositor* = ref object of Wl_object
  Wl_shm_pool_opcode* = enum
    Create_buffer, Destroy, Resize
  Wl_shm_pool* = ref object of Wl_object
  Wl_shm_opcode* = enum
    Create_pool, Format, Release
  Wl_shm* = ref object of Wl_object
  Wl_buffer_opcode* = enum
    Destroy, Release
  Wl_buffer* = ref object of Wl_object
  Wl_data_offer_opcode* = enum
    Accept, Receive, Destroy, Offer, Finish, Set_actions, Source_actions, Action
  Wl_data_offer* = ref object of Wl_object
  Wl_data_source_opcode* = enum
    Offer, Destroy, Target, Send, Cancelled, Set_actions, Dnd_drop_performed,
    Dnd_finished, Action
  Wl_data_source* = ref object of Wl_object
  Wl_data_device_opcode* = enum
    Start_drag, Set_selection, Data_offer, Enter, Leave, Motion, Drop,
    Selection, Release
  Wl_data_device* = ref object of Wl_object
  Wl_data_device_manager_opcode* = enum
    Create_data_source, Get_data_device
  Wl_data_device_manager* = ref object of Wl_object
  Wl_shell_opcode* = enum
    Get_shell_surface
  Wl_shell* = ref object of Wl_object
  Wl_shell_surface_opcode* = enum
    Pong, Move, Resize, Set_toplevel, Set_transient, Set_fullscreen, Set_popup,
    Set_maximized, Set_title, Set_class, Ping, Configure, Popup_done
  Wl_shell_surface* = ref object of Wl_object
  Wl_surface_opcode* = enum
    Destroy, Attach, Damage, Frame, Set_opaque_region, Set_input_region, Commit,
    Enter, Leave, Set_buffer_transform, Set_buffer_scale, Damage_buffer, Offset,
    Preferred_buffer_scale, Preferred_buffer_transform
  Wl_surface* = ref object of Wl_object
  Wl_seat_opcode* = enum
    Capabilities, Get_pointer, Get_keyboard, Get_touch, Name, Release
  Wl_seat* = ref object of Wl_object
  Wl_pointer_opcode* = enum
    Set_cursor, Enter, Leave, Motion, Button, Axis, Release, Frame, Axis_source,
    Axis_stop, Axis_discrete, Axis_value120, Axis_relative_direction
  Wl_pointer* = ref object of Wl_object
  Wl_keyboard_opcode* = enum
    Keymap, Enter, Leave, Key, Modifiers, Release, Repeat_info
  Wl_keyboard* = ref object of Wl_object
  Wl_touch_opcode* = enum
    Down, Up, Motion, Frame, Cancel, Release, Shape, Orientation
  Wl_touch* = ref object of Wl_object
  Wl_output_opcode* = enum
    Geometry, Mode, Done, Scale, Release, Name, Description
  Wl_output* = ref object of Wl_object
  Wl_region_opcode* = enum
    Destroy, Add, Subtract
  Wl_region* = ref object of Wl_object
  Wl_subcompositor_opcode* = enum
    Destroy, Get_subsurface
  Wl_subcompositor* = ref object of Wl_object
  Wl_subsurface_opcode* = enum
    Destroy, Set_position, Place_above, Place_below, Set_sync, Set_desync
  Wl_subsurface* = ref object of Wl_object
proc `sync`*(obj: Wl_display; `callback`: Wl_callback) =
  discard

proc `get_registry`*(obj: Wl_display; `registry`: Wl_registry) =
  discard

method `error`*(obj: Wl_display; `object_id`: Oid; `code`: uint;
                `message`: string) {.base.} =
  discard

method `delete_id`*(obj: Wl_display; `id`: uint) {.base.} =
  discard

proc `bind`*(obj: Wl_registry; `name`: uint; `id`: Oid) =
  discard

method `global`*(obj: Wl_registry; `name`: uint; `interface`: string;
                 `version`: uint) {.base.} =
  discard

method `global_remove`*(obj: Wl_registry; `name`: uint) {.base.} =
  discard

method `done`*(obj: Wl_callback; `callback_data`: uint) {.base.} =
  discard

proc `create_surface`*(obj: Wl_compositor; `id`: Wl_surface) =
  discard

proc `create_region`*(obj: Wl_compositor; `id`: Wl_region) =
  discard

proc `create_buffer`*(obj: Wl_shm_pool; `id`: Wl_buffer; `offset`: int;
                      `width`: int; `height`: int; `stride`: int; `format`: uint) =
  discard

proc `destroy`*(obj: Wl_shm_pool) =
  discard

proc `resize`*(obj: Wl_shm_pool; `size`: int) =
  discard

proc `create_pool`*(obj: Wl_shm; `id`: Wl_shm_pool; `fd`: cint; `size`: int) =
  discard

method `format`*(obj: Wl_shm; `format`: uint) {.base.} =
  discard

proc `release`*(obj: Wl_shm) =
  discard

proc `destroy`*(obj: Wl_buffer) =
  discard

method `release`*(obj: Wl_buffer) {.base.} =
  discard

proc `accept`*(obj: Wl_data_offer; `serial`: uint; `mime_type`: string) =
  discard

proc `receive`*(obj: Wl_data_offer; `mime_type`: string; `fd`: cint) =
  discard

proc `destroy`*(obj: Wl_data_offer) =
  discard

method `offer`*(obj: Wl_data_offer; `mime_type`: string) {.base.} =
  discard

proc `finish`*(obj: Wl_data_offer) =
  discard

proc `set_actions`*(obj: Wl_data_offer; `dnd_actions`: uint;
                    `preferred_action`: uint) =
  discard

method `source_actions`*(obj: Wl_data_offer; `source_actions`: uint) {.base.} =
  discard

method `action`*(obj: Wl_data_offer; `dnd_action`: uint) {.base.} =
  discard

proc `offer`*(obj: Wl_data_source; `mime_type`: string) =
  discard

proc `destroy`*(obj: Wl_data_source) =
  discard

method `target`*(obj: Wl_data_source; `mime_type`: string) {.base.} =
  discard

method `send`*(obj: Wl_data_source; `mime_type`: string; `fd`: cint) {.base.} =
  discard

method `cancelled`*(obj: Wl_data_source) {.base.} =
  discard

proc `set_actions`*(obj: Wl_data_source; `dnd_actions`: uint) =
  discard

method `dnd_drop_performed`*(obj: Wl_data_source) {.base.} =
  discard

method `dnd_finished`*(obj: Wl_data_source) {.base.} =
  discard

method `action`*(obj: Wl_data_source; `dnd_action`: uint) {.base.} =
  discard

proc `start_drag`*(obj: Wl_data_device; `source`: Wl_data_source;
                   `origin`: Wl_surface; `icon`: Wl_surface; `serial`: uint) =
  discard

proc `set_selection`*(obj: Wl_data_device; `source`: Wl_data_source;
                      `serial`: uint) =
  discard

method `data_offer`*(obj: Wl_data_device; `id`: Wl_data_offer) {.base.} =
  discard

method `enter`*(obj: Wl_data_device; `serial`: uint; `surface`: Wl_surface;
                `x`: SignedDecimal; `y`: SignedDecimal; `id`: Wl_data_offer) {.
    base.} =
  discard

method `leave`*(obj: Wl_data_device) {.base.} =
  discard

method `motion`*(obj: Wl_data_device; `time`: uint; `x`: SignedDecimal;
                 `y`: SignedDecimal) {.base.} =
  discard

method `drop`*(obj: Wl_data_device) {.base.} =
  discard

method `selection`*(obj: Wl_data_device; `id`: Wl_data_offer) {.base.} =
  discard

proc `release`*(obj: Wl_data_device) =
  discard

proc `create_data_source`*(obj: Wl_data_device_manager; `id`: Wl_data_source) =
  discard

proc `get_data_device`*(obj: Wl_data_device_manager; `id`: Wl_data_device;
                        `seat`: Wl_seat) =
  discard

proc `get_shell_surface`*(obj: Wl_shell; `id`: Wl_shell_surface;
                          `surface`: Wl_surface) =
  discard

proc `pong`*(obj: Wl_shell_surface; `serial`: uint) =
  discard

proc `move`*(obj: Wl_shell_surface; `seat`: Wl_seat; `serial`: uint) =
  discard

proc `resize`*(obj: Wl_shell_surface; `seat`: Wl_seat; `serial`: uint;
               `edges`: uint) =
  discard

proc `set_toplevel`*(obj: Wl_shell_surface) =
  discard

proc `set_transient`*(obj: Wl_shell_surface; `parent`: Wl_surface; `x`: int;
                      `y`: int; `flags`: uint) =
  discard

proc `set_fullscreen`*(obj: Wl_shell_surface; `method`: uint; `framerate`: uint;
                       `output`: Wl_output) =
  discard

proc `set_popup`*(obj: Wl_shell_surface; `seat`: Wl_seat; `serial`: uint;
                  `parent`: Wl_surface; `x`: int; `y`: int; `flags`: uint) =
  discard

proc `set_maximized`*(obj: Wl_shell_surface; `output`: Wl_output) =
  discard

proc `set_title`*(obj: Wl_shell_surface; `title`: string) =
  discard

proc `set_class`*(obj: Wl_shell_surface; `class`: string) =
  discard

method `ping`*(obj: Wl_shell_surface; `serial`: uint) {.base.} =
  discard

method `configure`*(obj: Wl_shell_surface; `edges`: uint; `width`: int;
                    `height`: int) {.base.} =
  discard

method `popup_done`*(obj: Wl_shell_surface) {.base.} =
  discard

proc `destroy`*(obj: Wl_surface) =
  discard

proc `attach`*(obj: Wl_surface; `buffer`: Wl_buffer; `x`: int; `y`: int) =
  discard

proc `damage`*(obj: Wl_surface; `x`: int; `y`: int; `width`: int; `height`: int) =
  discard

proc `frame`*(obj: Wl_surface; `callback`: Wl_callback) =
  discard

proc `set_opaque_region`*(obj: Wl_surface; `region`: Wl_region) =
  discard

proc `set_input_region`*(obj: Wl_surface; `region`: Wl_region) =
  discard

proc `commit`*(obj: Wl_surface) =
  discard

method `enter`*(obj: Wl_surface; `output`: Wl_output) {.base.} =
  discard

method `leave`*(obj: Wl_surface; `output`: Wl_output) {.base.} =
  discard

proc `set_buffer_transform`*(obj: Wl_surface; `transform`: int) =
  discard

proc `set_buffer_scale`*(obj: Wl_surface; `scale`: int) =
  discard

proc `damage_buffer`*(obj: Wl_surface; `x`: int; `y`: int; `width`: int;
                      `height`: int) =
  discard

proc `offset`*(obj: Wl_surface; `x`: int; `y`: int) =
  discard

method `preferred_buffer_scale`*(obj: Wl_surface; `factor`: int) {.base.} =
  discard

method `preferred_buffer_transform`*(obj: Wl_surface; `transform`: uint) {.base.} =
  discard

method `capabilities`*(obj: Wl_seat; `capabilities`: uint) {.base.} =
  discard

proc `get_pointer`*(obj: Wl_seat; `id`: Wl_pointer) =
  discard

proc `get_keyboard`*(obj: Wl_seat; `id`: Wl_keyboard) =
  discard

proc `get_touch`*(obj: Wl_seat; `id`: Wl_touch) =
  discard

method `name`*(obj: Wl_seat; `name`: string) {.base.} =
  discard

proc `release`*(obj: Wl_seat) =
  discard

proc `set_cursor`*(obj: Wl_pointer; `serial`: uint; `surface`: Wl_surface;
                   `hotspot_x`: int; `hotspot_y`: int) =
  discard

method `enter`*(obj: Wl_pointer; `serial`: uint; `surface`: Wl_surface;
                `surface_x`: SignedDecimal; `surface_y`: SignedDecimal) {.base.} =
  discard

method `leave`*(obj: Wl_pointer; `serial`: uint; `surface`: Wl_surface) {.base.} =
  discard

method `motion`*(obj: Wl_pointer; `time`: uint; `surface_x`: SignedDecimal;
                 `surface_y`: SignedDecimal) {.base.} =
  discard

method `button`*(obj: Wl_pointer; `serial`: uint; `time`: uint; `button`: uint;
                 `state`: uint) {.base.} =
  discard

method `axis`*(obj: Wl_pointer; `time`: uint; `axis`: uint;
               `value`: SignedDecimal) {.base.} =
  discard

proc `release`*(obj: Wl_pointer) =
  discard

method `frame`*(obj: Wl_pointer) {.base.} =
  discard

method `axis_source`*(obj: Wl_pointer; `axis_source`: uint) {.base.} =
  discard

method `axis_stop`*(obj: Wl_pointer; `time`: uint; `axis`: uint) {.base.} =
  discard

method `axis_discrete`*(obj: Wl_pointer; `axis`: uint; `discrete`: int) {.base.} =
  discard

method `axis_value120`*(obj: Wl_pointer; `axis`: uint; `value120`: int) {.base.} =
  discard

method `axis_relative_direction`*(obj: Wl_pointer; `axis`: uint;
                                  `direction`: uint) {.base.} =
  discard

method `keymap`*(obj: Wl_keyboard; `format`: uint; `fd`: cint; `size`: uint) {.
    base.} =
  discard

method `enter`*(obj: Wl_keyboard; `serial`: uint; `surface`: Wl_surface;
                `keys`: Sequence) {.base.} =
  discard

method `leave`*(obj: Wl_keyboard; `serial`: uint; `surface`: Wl_surface) {.base.} =
  discard

method `key`*(obj: Wl_keyboard; `serial`: uint; `time`: uint; `key`: uint;
              `state`: uint) {.base.} =
  discard

method `modifiers`*(obj: Wl_keyboard; `serial`: uint; `mods_depressed`: uint;
                    `mods_latched`: uint; `mods_locked`: uint; `group`: uint) {.
    base.} =
  discard

proc `release`*(obj: Wl_keyboard) =
  discard

method `repeat_info`*(obj: Wl_keyboard; `rate`: int; `delay`: int) {.base.} =
  discard

method `down`*(obj: Wl_touch; `serial`: uint; `time`: uint;
               `surface`: Wl_surface; `id`: int; `x`: SignedDecimal;
               `y`: SignedDecimal) {.base.} =
  discard

method `up`*(obj: Wl_touch; `serial`: uint; `time`: uint; `id`: int) {.base.} =
  discard

method `motion`*(obj: Wl_touch; `time`: uint; `id`: int; `x`: SignedDecimal;
                 `y`: SignedDecimal) {.base.} =
  discard

method `frame`*(obj: Wl_touch) {.base.} =
  discard

method `cancel`*(obj: Wl_touch) {.base.} =
  discard

proc `release`*(obj: Wl_touch) =
  discard

method `shape`*(obj: Wl_touch; `id`: int; `major`: SignedDecimal;
                `minor`: SignedDecimal) {.base.} =
  discard

method `orientation`*(obj: Wl_touch; `id`: int; `orientation`: SignedDecimal) {.
    base.} =
  discard

method `geometry`*(obj: Wl_output; `x`: int; `y`: int; `physical_width`: int;
                   `physical_height`: int; `subpixel`: int; `make`: string;
                   `model`: string; `transform`: int) {.base.} =
  discard

method `mode`*(obj: Wl_output; `flags`: uint; `width`: int; `height`: int;
               `refresh`: int) {.base.} =
  discard

method `done`*(obj: Wl_output) {.base.} =
  discard

method `scale`*(obj: Wl_output; `factor`: int) {.base.} =
  discard

proc `release`*(obj: Wl_output) =
  discard

method `name`*(obj: Wl_output; `name`: string) {.base.} =
  discard

method `description`*(obj: Wl_output; `description`: string) {.base.} =
  discard

proc `destroy`*(obj: Wl_region) =
  discard

proc `add`*(obj: Wl_region; `x`: int; `y`: int; `width`: int; `height`: int) =
  discard

proc `subtract`*(obj: Wl_region; `x`: int; `y`: int; `width`: int; `height`: int) =
  discard

proc `destroy`*(obj: Wl_subcompositor) =
  discard

proc `get_subsurface`*(obj: Wl_subcompositor; `id`: Wl_subsurface;
                       `surface`: Wl_surface; `parent`: Wl_surface) =
  discard

proc `destroy`*(obj: Wl_subsurface) =
  discard

proc `set_position`*(obj: Wl_subsurface; `x`: int; `y`: int) =
  discard

proc `place_above`*(obj: Wl_subsurface; `sibling`: Wl_surface) =
  discard

proc `place_below`*(obj: Wl_subsurface; `sibling`: Wl_surface) =
  discard

proc `set_sync`*(obj: Wl_subsurface) =
  discard

proc `set_desync`*(obj: Wl_subsurface) =
  discard
