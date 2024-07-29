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
  request(obj, Sync.uint32, (`callback`,))

proc `get_registry`*(obj: Wl_display; `registry`: Wl_registry) =
  request(obj, Get_registry.uint32, (`registry`,))

method `error`*(obj: Wl_display; `object_id`: Oid; `code`: uint;
                `message`: string) {.base.} =
  discard

method `delete_id`*(obj: Wl_display; `id`: uint) {.base.} =
  discard

proc `bind`*(obj: Wl_registry; `name`: uint; `id`: Oid) =
  request(obj, Bind.uint32, (`name`, `id`))

method `global`*(obj: Wl_registry; `name`: uint; `interface`: string;
                 `version`: uint) {.base.} =
  discard

method `global_remove`*(obj: Wl_registry; `name`: uint) {.base.} =
  discard

method `done`*(obj: Wl_callback; `callback_data`: uint) {.base.} =
  discard

proc `create_surface`*(obj: Wl_compositor; `id`: Wl_surface) =
  request(obj, Create_surface.uint32, (`id`,))

proc `create_region`*(obj: Wl_compositor; `id`: Wl_region) =
  request(obj, Create_region.uint32, (`id`,))

proc `create_buffer`*(obj: Wl_shm_pool; `id`: Wl_buffer; `offset`: int;
                      `width`: int; `height`: int; `stride`: int; `format`: uint) =
  request(obj, Create_buffer.uint32,
          (`id`, `offset`, `width`, `height`, `stride`, `format`))

proc `destroy`*(obj: Wl_shm_pool) =
  request(obj, Destroy.uint32)

proc `resize`*(obj: Wl_shm_pool; `size`: int) =
  request(obj, Resize.uint32, (`size`,))

proc `create_pool`*(obj: Wl_shm; `id`: Wl_shm_pool; `fd`: cint; `size`: int) =
  request(obj, Create_pool.uint32, (`id`, `fd`, `size`))

method `format`*(obj: Wl_shm; `format`: uint) {.base.} =
  discard

proc `release`*(obj: Wl_shm) =
  request(obj, Release.uint32)

proc `destroy`*(obj: Wl_buffer) =
  request(obj, Destroy.uint32)

method `release`*(obj: Wl_buffer) {.base.} =
  discard

proc `accept`*(obj: Wl_data_offer; `serial`: uint; `mime_type`: string) =
  request(obj, Accept.uint32, (`serial`, `mime_type`))

proc `receive`*(obj: Wl_data_offer; `mime_type`: string; `fd`: cint) =
  request(obj, Receive.uint32, (`mime_type`, `fd`))

proc `destroy`*(obj: Wl_data_offer) =
  request(obj, Destroy.uint32)

method `offer`*(obj: Wl_data_offer; `mime_type`: string) {.base.} =
  discard

proc `finish`*(obj: Wl_data_offer) =
  request(obj, Finish.uint32)

proc `set_actions`*(obj: Wl_data_offer; `dnd_actions`: uint;
                    `preferred_action`: uint) =
  request(obj, Set_actions.uint32, (`dnd_actions`, `preferred_action`))

method `source_actions`*(obj: Wl_data_offer; `source_actions`: uint) {.base.} =
  discard

method `action`*(obj: Wl_data_offer; `dnd_action`: uint) {.base.} =
  discard

proc `offer`*(obj: Wl_data_source; `mime_type`: string) =
  request(obj, Offer.uint32, (`mime_type`,))

proc `destroy`*(obj: Wl_data_source) =
  request(obj, Destroy.uint32)

method `target`*(obj: Wl_data_source; `mime_type`: string) {.base.} =
  discard

method `send`*(obj: Wl_data_source; `mime_type`: string; `fd`: cint) {.base.} =
  discard

method `cancelled`*(obj: Wl_data_source) {.base.} =
  discard

proc `set_actions`*(obj: Wl_data_source; `dnd_actions`: uint) =
  request(obj, Set_actions.uint32, (`dnd_actions`,))

method `dnd_drop_performed`*(obj: Wl_data_source) {.base.} =
  discard

method `dnd_finished`*(obj: Wl_data_source) {.base.} =
  discard

method `action`*(obj: Wl_data_source; `dnd_action`: uint) {.base.} =
  discard

proc `start_drag`*(obj: Wl_data_device; `source`: Wl_data_source;
                   `origin`: Wl_surface; `icon`: Wl_surface; `serial`: uint) =
  request(obj, Start_drag.uint32, (`source`, `origin`, `icon`, `serial`))

proc `set_selection`*(obj: Wl_data_device; `source`: Wl_data_source;
                      `serial`: uint) =
  request(obj, Set_selection.uint32, (`source`, `serial`))

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
  request(obj, Release.uint32)

proc `create_data_source`*(obj: Wl_data_device_manager; `id`: Wl_data_source) =
  request(obj, Create_data_source.uint32, (`id`,))

proc `get_data_device`*(obj: Wl_data_device_manager; `id`: Wl_data_device;
                        `seat`: Wl_seat) =
  request(obj, Get_data_device.uint32, (`id`, `seat`))

proc `get_shell_surface`*(obj: Wl_shell; `id`: Wl_shell_surface;
                          `surface`: Wl_surface) =
  request(obj, Get_shell_surface.uint32, (`id`, `surface`))

proc `pong`*(obj: Wl_shell_surface; `serial`: uint) =
  request(obj, Pong.uint32, (`serial`,))

proc `move`*(obj: Wl_shell_surface; `seat`: Wl_seat; `serial`: uint) =
  request(obj, Move.uint32, (`seat`, `serial`))

proc `resize`*(obj: Wl_shell_surface; `seat`: Wl_seat; `serial`: uint;
               `edges`: uint) =
  request(obj, Resize.uint32, (`seat`, `serial`, `edges`))

proc `set_toplevel`*(obj: Wl_shell_surface) =
  request(obj, Set_toplevel.uint32)

proc `set_transient`*(obj: Wl_shell_surface; `parent`: Wl_surface; `x`: int;
                      `y`: int; `flags`: uint) =
  request(obj, Set_transient.uint32, (`parent`, `x`, `y`, `flags`))

proc `set_fullscreen`*(obj: Wl_shell_surface; `method`: uint; `framerate`: uint;
                       `output`: Wl_output) =
  request(obj, Set_fullscreen.uint32, (`method`, `framerate`, `output`))

proc `set_popup`*(obj: Wl_shell_surface; `seat`: Wl_seat; `serial`: uint;
                  `parent`: Wl_surface; `x`: int; `y`: int; `flags`: uint) =
  request(obj, Set_popup.uint32,
          (`seat`, `serial`, `parent`, `x`, `y`, `flags`))

proc `set_maximized`*(obj: Wl_shell_surface; `output`: Wl_output) =
  request(obj, Set_maximized.uint32, (`output`,))

proc `set_title`*(obj: Wl_shell_surface; `title`: string) =
  request(obj, Set_title.uint32, (`title`,))

proc `set_class`*(obj: Wl_shell_surface; `class`: string) =
  request(obj, Set_class.uint32, (`class`,))

method `ping`*(obj: Wl_shell_surface; `serial`: uint) {.base.} =
  discard

method `configure`*(obj: Wl_shell_surface; `edges`: uint; `width`: int;
                    `height`: int) {.base.} =
  discard

method `popup_done`*(obj: Wl_shell_surface) {.base.} =
  discard

proc `destroy`*(obj: Wl_surface) =
  request(obj, Destroy.uint32)

proc `attach`*(obj: Wl_surface; `buffer`: Wl_buffer; `x`: int; `y`: int) =
  request(obj, Attach.uint32, (`buffer`, `x`, `y`))

proc `damage`*(obj: Wl_surface; `x`: int; `y`: int; `width`: int; `height`: int) =
  request(obj, Damage.uint32, (`x`, `y`, `width`, `height`))

proc `frame`*(obj: Wl_surface; `callback`: Wl_callback) =
  request(obj, Frame.uint32, (`callback`,))

proc `set_opaque_region`*(obj: Wl_surface; `region`: Wl_region) =
  request(obj, Set_opaque_region.uint32, (`region`,))

proc `set_input_region`*(obj: Wl_surface; `region`: Wl_region) =
  request(obj, Set_input_region.uint32, (`region`,))

proc `commit`*(obj: Wl_surface) =
  request(obj, Commit.uint32)

method `enter`*(obj: Wl_surface; `output`: Wl_output) {.base.} =
  discard

method `leave`*(obj: Wl_surface; `output`: Wl_output) {.base.} =
  discard

proc `set_buffer_transform`*(obj: Wl_surface; `transform`: int) =
  request(obj, Set_buffer_transform.uint32, (`transform`,))

proc `set_buffer_scale`*(obj: Wl_surface; `scale`: int) =
  request(obj, Set_buffer_scale.uint32, (`scale`,))

proc `damage_buffer`*(obj: Wl_surface; `x`: int; `y`: int; `width`: int;
                      `height`: int) =
  request(obj, Damage_buffer.uint32, (`x`, `y`, `width`, `height`))

proc `offset`*(obj: Wl_surface; `x`: int; `y`: int) =
  request(obj, Offset.uint32, (`x`, `y`))

method `preferred_buffer_scale`*(obj: Wl_surface; `factor`: int) {.base.} =
  discard

method `preferred_buffer_transform`*(obj: Wl_surface; `transform`: uint) {.base.} =
  discard

method `capabilities`*(obj: Wl_seat; `capabilities`: uint) {.base.} =
  discard

proc `get_pointer`*(obj: Wl_seat; `id`: Wl_pointer) =
  request(obj, Get_pointer.uint32, (`id`,))

proc `get_keyboard`*(obj: Wl_seat; `id`: Wl_keyboard) =
  request(obj, Get_keyboard.uint32, (`id`,))

proc `get_touch`*(obj: Wl_seat; `id`: Wl_touch) =
  request(obj, Get_touch.uint32, (`id`,))

method `name`*(obj: Wl_seat; `name`: string) {.base.} =
  discard

proc `release`*(obj: Wl_seat) =
  request(obj, Release.uint32)

proc `set_cursor`*(obj: Wl_pointer; `serial`: uint; `surface`: Wl_surface;
                   `hotspot_x`: int; `hotspot_y`: int) =
  request(obj, Set_cursor.uint32,
          (`serial`, `surface`, `hotspot_x`, `hotspot_y`))

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
  request(obj, Release.uint32)

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
  request(obj, Release.uint32)

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
  request(obj, Release.uint32)

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
  request(obj, Release.uint32)

method `name`*(obj: Wl_output; `name`: string) {.base.} =
  discard

method `description`*(obj: Wl_output; `description`: string) {.base.} =
  discard

proc `destroy`*(obj: Wl_region) =
  request(obj, Destroy.uint32)

proc `add`*(obj: Wl_region; `x`: int; `y`: int; `width`: int; `height`: int) =
  request(obj, Add.uint32, (`x`, `y`, `width`, `height`))

proc `subtract`*(obj: Wl_region; `x`: int; `y`: int; `width`: int; `height`: int) =
  request(obj, Subtract.uint32, (`x`, `y`, `width`, `height`))

proc `destroy`*(obj: Wl_subcompositor) =
  request(obj, Destroy.uint32)

proc `get_subsurface`*(obj: Wl_subcompositor; `id`: Wl_subsurface;
                       `surface`: Wl_surface; `parent`: Wl_surface) =
  request(obj, Get_subsurface.uint32, (`id`, `surface`, `parent`))

proc `destroy`*(obj: Wl_subsurface) =
  request(obj, Destroy.uint32)

proc `set_position`*(obj: Wl_subsurface; `x`: int; `y`: int) =
  request(obj, Set_position.uint32, (`x`, `y`))

proc `place_above`*(obj: Wl_subsurface; `sibling`: Wl_surface) =
  request(obj, Place_above.uint32, (`sibling`,))

proc `place_below`*(obj: Wl_subsurface; `sibling`: Wl_surface) =
  request(obj, Place_below.uint32, (`sibling`,))

proc `set_sync`*(obj: Wl_subsurface) =
  request(obj, Set_sync.uint32)

proc `set_desync`*(obj: Wl_subsurface) =
  request(obj, Set_desync.uint32)
