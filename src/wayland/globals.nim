# SPDX-License-Identifier: MIT

import
  pkg / wayland / clients

type
  Wl_display* = ref object of Wl_object
  Wl_display_error* = enum
    `invalid_object` = 0, `invalid_method` = 1, `no_memory` = 2,
    `implementation` = 3
type
  Wl_registry* = ref object of Wl_object
type
  Wl_callback* = ref object of Wl_object
type
  Wl_compositor* = ref object of Wl_object
type
  Wl_shm_pool* = ref object of Wl_object
type
  Wl_shm* = ref object of Wl_object
  Wl_shm_error* = enum
    `invalid_format` = 0, `invalid_stride` = 1, `invalid_fd` = 2
  Wl_shm_format* = enum
    `argb8888` = 0, `xrgb8888` = 1, `c1` = 538980675, `d1` = 538980676,
    `r1` = 538980690, `c2` = 538980931, `d2` = 538980932, `r2` = 538980946,
    `c4` = 538981443, `d4` = 538981444, `r4` = 538981458, `c8` = 538982467,
    `d8` = 538982468, `r8` = 538982482, `r10` = 540029266, `r12` = 540160338,
    `r16` = 540422482, `p010` = 808530000, `p210` = 808530512,
    `y210` = 808530521, `q410` = 808531025, `y410` = 808531033,
    `axbxgxrx106106106106` = 808534593, `yuv420_10bit` = 808539481,
    `p030` = 808661072, `bgra1010102` = 808665410, `rgba1010102` = 808665426,
    `abgr2101010` = 808665665, `xbgr2101010` = 808665688,
    `argb2101010` = 808669761, `xrgb2101010` = 808669784,
    `vuy101010` = 808670550, `xvyu2101010` = 808670808,
    `bgrx1010102` = 808671298, `rgbx1010102` = 808671314, `x0l0` = 810299480,
    `y0l0` = 810299481, `q401` = 825242705, `yuv411` = 825316697,
    `yvu411` = 825316953, `nv21` = 825382478, `nv61` = 825644622,
    `p012` = 842084432, `y212` = 842084953, `y412` = 842085465,
    `bgra4444` = 842088770, `rgba4444` = 842088786, `abgr4444` = 842089025,
    `xbgr4444` = 842089048, `argb4444` = 842093121, `xrgb4444` = 842093144,
    `yuv420` = 842093913, `nv12` = 842094158, `yvu420` = 842094169,
    `bgrx4444` = 842094658, `rgbx4444` = 842094674, `rg1616` = 842221394,
    `gr1616` = 842224199, `nv42` = 842290766, `x0l2` = 843853912,
    `y0l2` = 843853913, `bgra8888` = 875708738, `rgba8888` = 875708754,
    `abgr8888` = 875708993, `xbgr8888` = 875709016, `bgr888` = 875710274,
    `rgb888` = 875710290, `vuy888` = 875713878, `yuv444` = 875713881,
    `nv24` = 875714126, `yvu444` = 875714137, `bgrx8888` = 875714626,
    `rgbx8888` = 875714642, `bgra5551` = 892420418, `rgba5551` = 892420434,
    `abgr1555` = 892420673, `xbgr1555` = 892420696, `argb1555` = 892424769,
    `xrgb1555` = 892424792, `nv15` = 892425806, `bgrx5551` = 892426306,
    `rgbx5551` = 892426322, `p016` = 909193296, `y216` = 909193817,
    `y416` = 909194329, `bgr565` = 909199170, `rgb565` = 909199186,
    `yuv422` = 909202777, `nv16` = 909203022, `yvu422` = 909203033,
    `xvyu12_16161616` = 909334104, `yuv420_8bit` = 942691673,
    `abgr16161616` = 942948929, `xbgr16161616` = 942948952,
    `argb16161616` = 942953025, `xrgb16161616` = 942953048,
    `xvyu16161616` = 942954072, `rg88` = 943212370, `gr88` = 943215175,
    `bgr565_a8` = 943797570, `rgb565_a8` = 943797586, `bgr888_a8` = 943798338,
    `rgb888_a8` = 943798354, `xbgr8888_a8` = 943800920,
    `xrgb8888_a8` = 943805016, `bgrx8888_a8` = 943806530,
    `rgbx8888_a8` = 943806546, `rgb332` = 943867730, `bgr233` = 944916290,
    `yvu410` = 961893977, `yuv410` = 961959257, `abgr16161616f` = 1211384385,
    `xbgr16161616f` = 1211384408, `argb16161616f` = 1211388481,
    `xrgb16161616f` = 1211388504, `yvyu` = 1431918169, `ayuv` = 1448433985,
    `xyuv8888` = 1448434008, `yuyv` = 1448695129, `avuy8888` = 1498764865,
    `xvuy8888` = 1498764888, `vyuy` = 1498765654, `uyvy` = 1498831189
type
  Wl_buffer* = ref object of Wl_object
type
  Wl_data_offer* = ref object of Wl_object
  Wl_data_offer_error* = enum
    `invalid_finish` = 0, `invalid_action_mask` = 1, `invalid_action` = 2,
    `invalid_offer` = 3
type
  Wl_data_source* = ref object of Wl_object
  Wl_data_source_error* = enum
    `invalid_action_mask` = 0, `invalid_source` = 1
type
  Wl_data_device* = ref object of Wl_object
  Wl_data_device_error* = enum
    `role` = 0, `used_source` = 1
type
  Wl_data_device_manager* = ref object of Wl_object
  Wl_data_device_manager_dnd_action* = enum
    `none` = 0, `copy` = 1, `move` = 2, `ask` = 4
type
  Wl_shell* = ref object of Wl_object
  Wl_shell_error* = enum
    `role` = 0
type
  Wl_shell_surface* = ref object of Wl_object
  Wl_shell_surface_resize* = enum
    `none` = 0, `top` = 1, `bottom` = 2, `left` = 4, `top_left` = 5,
    `bottom_left` = 6, `right` = 8, `top_right` = 9, `bottom_right` = 10
  Wl_shell_surface_transient* = enum
    `inactive` = 1
  Wl_shell_surface_fullscreen_method* = enum
    `default` = 0, `scale` = 1, `driver` = 2, `fill` = 3
type
  Wl_surface* = ref object of Wl_object
  Wl_surface_error* = enum
    `invalid_scale` = 0, `invalid_transform` = 1, `invalid_size` = 2,
    `invalid_offset` = 3, `defunct_role_object` = 4
type
  Wl_seat* = ref object of Wl_object
  Wl_seat_capability* = enum
    `pointer` = 1, `keyboard` = 2, `touch` = 4
  Wl_seat_error* = enum
    `missing_capability` = 0
type
  Wl_pointer* = ref object of Wl_object
  Wl_pointer_error* = enum
    `role` = 0
  Wl_pointer_button_state* = enum
    `released` = 0, `pressed` = 1
  Wl_pointer_axis* = enum
    `vertical_scroll` = 0, `horizontal_scroll` = 1
  Wl_pointer_axis_source* = enum
    `wheel` = 0, `finger` = 1, `continuous` = 2, `wheel_tilt` = 3
  Wl_pointer_axis_relative_direction* = enum
    `identical` = 0, `inverted` = 1
type
  Wl_keyboard* = ref object of Wl_object
  Wl_keyboard_keymap_format* = enum
    `no_keymap` = 0, `xkb_v1` = 1
  Wl_keyboard_key_state* = enum
    `released` = 0, `pressed` = 1
type
  Wl_touch* = ref object of Wl_object
type
  Wl_output* = ref object of Wl_object
  Wl_output_subpixel* = enum
    `unknown` = 0, `none` = 1, `horizontal_rgb` = 2, `horizontal_bgr` = 3,
    `vertical_rgb` = 4, `vertical_bgr` = 5
  Wl_output_transform* = enum
    `normal` = 0, `90` = 1, `180` = 2, `270` = 3, `flipped` = 4,
    `flipped_90` = 5, `flipped_180` = 6, `flipped_270` = 7
  Wl_output_mode* = enum
    `current` = 1, `preferred` = 2
type
  Wl_region* = ref object of Wl_object
type
  Wl_subcompositor* = ref object of Wl_object
  Wl_subcompositor_error* = enum
    `bad_surface` = 0, `bad_parent` = 1
type
  Wl_subsurface* = ref object of Wl_object
  Wl_subsurface_error* = enum
    `bad_surface` = 0
func face*(obj: Wl_display): string =
  "wl_display"

func version*(obj: Wl_display): uint =
  1

proc `sync`*(obj: Wl_display; `callback`: Wl_callback) =
  request(obj, 0, (`callback`,))

proc `get_registry`*(obj: Wl_display; `registry`: Wl_registry) =
  request(obj, 1, (`registry`,))

method `error`*(obj: Wl_display; `object_id`: Wl_object; `code`: uint;
                `message`: string) {.base.} =
  raiseAssert("wl_display.error not implemented")

method `delete_id`*(obj: Wl_display; `id`: uint) {.base.} =
  raiseAssert("wl_display.delete_id not implemented")

method dispatchEvent*(obj: Wl_display; msg: Message) =
  case msg.opcode
  of 0:
    var args: (Wl_object, uint, string)
    unmarshal(obj, msg, args)
    obj.`error`(args[0], args[1], args[2])
  of 1:
    var args: (uint,)
    unmarshal(obj, msg, args)
    obj.`delete_id`(args[0])
  else:
    raise newUnknownEventError("wl_display", msg.opcode)

func face*(obj: Wl_registry): string =
  "wl_registry"

func version*(obj: Wl_registry): uint =
  1

proc `bind`*(obj: Wl_registry; `name`: uint; `face`: string; `version`: uint;
             `oid`: Wl_object) =
  request(obj, 0, (`name`, `face`, `version`, `oid`))

method `global`*(obj: Wl_registry; `name`: uint; `interface`: string;
                 `version`: uint) {.base.} =
  raiseAssert("wl_registry.global not implemented")

method `global_remove`*(obj: Wl_registry; `name`: uint) {.base.} =
  raiseAssert("wl_registry.global_remove not implemented")

method dispatchEvent*(obj: Wl_registry; msg: Message) =
  case msg.opcode
  of 0:
    var args: (uint, string, uint)
    unmarshal(obj, msg, args)
    obj.`global`(args[0], args[1], args[2])
  of 1:
    var args: (uint,)
    unmarshal(obj, msg, args)
    obj.`global_remove`(args[0])
  else:
    raise newUnknownEventError("wl_registry", msg.opcode)

func face*(obj: Wl_callback): string =
  "wl_callback"

func version*(obj: Wl_callback): uint =
  1

method `done`*(obj: Wl_callback; `callback_data`: uint) {.base.} =
  raiseAssert("wl_callback.done not implemented")

method dispatchEvent*(obj: Wl_callback; msg: Message) =
  case msg.opcode
  of 0:
    var args: (uint,)
    unmarshal(obj, msg, args)
    obj.`done`(args[0])
  else:
    raise newUnknownEventError("wl_callback", msg.opcode)

func face*(obj: Wl_compositor): string =
  "wl_compositor"

func version*(obj: Wl_compositor): uint =
  6

proc `create_surface`*(obj: Wl_compositor; `id`: Wl_surface) =
  request(obj, 0, (`id`,))

proc `create_region`*(obj: Wl_compositor; `id`: Wl_region) =
  request(obj, 1, (`id`,))

func face*(obj: Wl_shm_pool): string =
  "wl_shm_pool"

func version*(obj: Wl_shm_pool): uint =
  2

proc `create_buffer`*(obj: Wl_shm_pool; `id`: Wl_buffer; `offset`: int;
                      `width`: int; `height`: int; `stride`: int;
                      `format`: Wl_shm_format) =
  request(obj, 0, (`id`, `offset`, `width`, `height`, `stride`, `format`))

proc `destroy`*(obj: Wl_shm_pool) =
  request(obj, 1, ())

proc `resize`*(obj: Wl_shm_pool; `size`: int) =
  request(obj, 2, (`size`,))

func face*(obj: Wl_shm): string =
  "wl_shm"

func version*(obj: Wl_shm): uint =
  2

proc `create_pool`*(obj: Wl_shm; `id`: Wl_shm_pool; `fd`: FD; `size`: int) =
  request(obj, 0, (`id`, `fd`, `size`))

method `format`*(obj: Wl_shm; `format`: Wl_shm_format) {.base.} =
  raiseAssert("wl_shm.format not implemented")

proc `release`*(obj: Wl_shm) =
  request(obj, 1, ())

method dispatchEvent*(obj: Wl_shm; msg: Message) =
  case msg.opcode
  of 0:
    var args: (Wl_shm_format,)
    unmarshal(obj, msg, args)
    obj.`format`(args[0])
  else:
    raise newUnknownEventError("wl_shm", msg.opcode)

func face*(obj: Wl_buffer): string =
  "wl_buffer"

func version*(obj: Wl_buffer): uint =
  1

proc `destroy`*(obj: Wl_buffer) =
  request(obj, 0, ())

method `release`*(obj: Wl_buffer) {.base.} =
  raiseAssert("wl_buffer.release not implemented")

method dispatchEvent*(obj: Wl_buffer; msg: Message) =
  case msg.opcode
  of 0:
    obj.`release`()
  else:
    raise newUnknownEventError("wl_buffer", msg.opcode)

func face*(obj: Wl_data_offer): string =
  "wl_data_offer"

func version*(obj: Wl_data_offer): uint =
  3

proc `accept`*(obj: Wl_data_offer; `serial`: uint; `mime_type`: string) =
  request(obj, 0, (`serial`, `mime_type`))

proc `receive`*(obj: Wl_data_offer; `mime_type`: string; `fd`: FD) =
  request(obj, 1, (`mime_type`, `fd`))

proc `destroy`*(obj: Wl_data_offer) =
  request(obj, 2, ())

method `offer`*(obj: Wl_data_offer; `mime_type`: string) {.base.} =
  raiseAssert("wl_data_offer.offer not implemented")

proc `finish`*(obj: Wl_data_offer) =
  request(obj, 3, ())

proc `set_actions`*(obj: Wl_data_offer;
                    `dnd_actions`: Wl_data_device_manager_dnd_action;
                    `preferred_action`: Wl_data_device_manager_dnd_action) =
  request(obj, 4, (`dnd_actions`, `preferred_action`))

method `source_actions`*(obj: Wl_data_offer;
                         `source_actions`: Wl_data_device_manager_dnd_action) {.
    base.} =
  raiseAssert("wl_data_offer.source_actions not implemented")

method `action`*(obj: Wl_data_offer;
                 `dnd_action`: Wl_data_device_manager_dnd_action) {.base.} =
  raiseAssert("wl_data_offer.action not implemented")

method dispatchEvent*(obj: Wl_data_offer; msg: Message) =
  case msg.opcode
  of 0:
    var args: (string,)
    unmarshal(obj, msg, args)
    obj.`offer`(args[0])
  of 1:
    var args: (Wl_data_device_manager_dnd_action,)
    unmarshal(obj, msg, args)
    obj.`source_actions`(args[0])
  of 2:
    var args: (Wl_data_device_manager_dnd_action,)
    unmarshal(obj, msg, args)
    obj.`action`(args[0])
  else:
    raise newUnknownEventError("wl_data_offer", msg.opcode)

func face*(obj: Wl_data_source): string =
  "wl_data_source"

func version*(obj: Wl_data_source): uint =
  3

proc `offer`*(obj: Wl_data_source; `mime_type`: string) =
  request(obj, 0, (`mime_type`,))

proc `destroy`*(obj: Wl_data_source) =
  request(obj, 1, ())

method `target`*(obj: Wl_data_source; `mime_type`: string) {.base.} =
  raiseAssert("wl_data_source.target not implemented")

method `send`*(obj: Wl_data_source; `mime_type`: string; `fd`: FD) {.base.} =
  raiseAssert("wl_data_source.send not implemented")

method `cancelled`*(obj: Wl_data_source) {.base.} =
  raiseAssert("wl_data_source.cancelled not implemented")

proc `set_actions`*(obj: Wl_data_source;
                    `dnd_actions`: Wl_data_device_manager_dnd_action) =
  request(obj, 2, (`dnd_actions`,))

method `dnd_drop_performed`*(obj: Wl_data_source) {.base.} =
  raiseAssert("wl_data_source.dnd_drop_performed not implemented")

method `dnd_finished`*(obj: Wl_data_source) {.base.} =
  raiseAssert("wl_data_source.dnd_finished not implemented")

method `action`*(obj: Wl_data_source;
                 `dnd_action`: Wl_data_device_manager_dnd_action) {.base.} =
  raiseAssert("wl_data_source.action not implemented")

method dispatchEvent*(obj: Wl_data_source; msg: Message) =
  case msg.opcode
  of 0:
    var args: (string,)
    unmarshal(obj, msg, args)
    obj.`target`(args[0])
  of 1:
    var args: (string, FD)
    unmarshal(obj, msg, args)
    obj.`send`(args[0], args[1])
  of 2:
    obj.`cancelled`()
  of 3:
    obj.`dnd_drop_performed`()
  of 4:
    obj.`dnd_finished`()
  of 5:
    var args: (Wl_data_device_manager_dnd_action,)
    unmarshal(obj, msg, args)
    obj.`action`(args[0])
  else:
    raise newUnknownEventError("wl_data_source", msg.opcode)

func face*(obj: Wl_data_device): string =
  "wl_data_device"

func version*(obj: Wl_data_device): uint =
  3

proc `start_drag`*(obj: Wl_data_device; `source`: Wl_data_source;
                   `origin`: Wl_surface; `icon`: Wl_surface; `serial`: uint) =
  request(obj, 0, (`source`, `origin`, `icon`, `serial`))

proc `set_selection`*(obj: Wl_data_device; `source`: Wl_data_source;
                      `serial`: uint) =
  request(obj, 1, (`source`, `serial`))

method `data_offer`*(obj: Wl_data_device; `id`: Wl_data_offer) {.base.} =
  raiseAssert("wl_data_device.data_offer not implemented")

method `enter`*(obj: Wl_data_device; `serial`: uint; `surface`: Wl_surface;
                `x`: SignedDecimal; `y`: SignedDecimal; `id`: Wl_data_offer) {.
    base.} =
  raiseAssert("wl_data_device.enter not implemented")

method `leave`*(obj: Wl_data_device) {.base.} =
  raiseAssert("wl_data_device.leave not implemented")

method `motion`*(obj: Wl_data_device; `time`: uint; `x`: SignedDecimal;
                 `y`: SignedDecimal) {.base.} =
  raiseAssert("wl_data_device.motion not implemented")

method `drop`*(obj: Wl_data_device) {.base.} =
  raiseAssert("wl_data_device.drop not implemented")

method `selection`*(obj: Wl_data_device; `id`: Wl_data_offer) {.base.} =
  raiseAssert("wl_data_device.selection not implemented")

proc `release`*(obj: Wl_data_device) =
  request(obj, 2, ())

method dispatchEvent*(obj: Wl_data_device; msg: Message) =
  case msg.opcode
  of 0:
    var args: (Wl_data_offer,)
    unmarshal(obj, msg, args)
    obj.`data_offer`(args[0])
  of 1:
    var args: (uint, Wl_surface, SignedDecimal, SignedDecimal, Wl_data_offer)
    unmarshal(obj, msg, args)
    obj.`enter`(args[0], args[1], args[2], args[3], args[4])
  of 2:
    obj.`leave`()
  of 3:
    var args: (uint, SignedDecimal, SignedDecimal)
    unmarshal(obj, msg, args)
    obj.`motion`(args[0], args[1], args[2])
  of 4:
    obj.`drop`()
  of 5:
    var args: (Wl_data_offer,)
    unmarshal(obj, msg, args)
    obj.`selection`(args[0])
  else:
    raise newUnknownEventError("wl_data_device", msg.opcode)

func face*(obj: Wl_data_device_manager): string =
  "wl_data_device_manager"

func version*(obj: Wl_data_device_manager): uint =
  3

proc `create_data_source`*(obj: Wl_data_device_manager; `id`: Wl_data_source) =
  request(obj, 0, (`id`,))

proc `get_data_device`*(obj: Wl_data_device_manager; `id`: Wl_data_device;
                        `seat`: Wl_seat) =
  request(obj, 1, (`id`, `seat`))

func face*(obj: Wl_shell): string =
  "wl_shell"

func version*(obj: Wl_shell): uint =
  1

proc `get_shell_surface`*(obj: Wl_shell; `id`: Wl_shell_surface;
                          `surface`: Wl_surface) =
  request(obj, 0, (`id`, `surface`))

func face*(obj: Wl_shell_surface): string =
  "wl_shell_surface"

func version*(obj: Wl_shell_surface): uint =
  1

proc `pong`*(obj: Wl_shell_surface; `serial`: uint) =
  request(obj, 0, (`serial`,))

proc `move`*(obj: Wl_shell_surface; `seat`: Wl_seat; `serial`: uint) =
  request(obj, 1, (`seat`, `serial`))

proc `resize`*(obj: Wl_shell_surface; `seat`: Wl_seat; `serial`: uint;
               `edges`: Wl_shell_surface_resize) =
  request(obj, 2, (`seat`, `serial`, `edges`))

proc `set_toplevel`*(obj: Wl_shell_surface) =
  request(obj, 3, ())

proc `set_transient`*(obj: Wl_shell_surface; `parent`: Wl_surface; `x`: int;
                      `y`: int; `flags`: Wl_shell_surface_transient) =
  request(obj, 4, (`parent`, `x`, `y`, `flags`))

proc `set_fullscreen`*(obj: Wl_shell_surface;
                       `method`: Wl_shell_surface_fullscreen_method;
                       `framerate`: uint; `output`: Wl_output) =
  request(obj, 5, (`method`, `framerate`, `output`))

proc `set_popup`*(obj: Wl_shell_surface; `seat`: Wl_seat; `serial`: uint;
                  `parent`: Wl_surface; `x`: int; `y`: int;
                  `flags`: Wl_shell_surface_transient) =
  request(obj, 6, (`seat`, `serial`, `parent`, `x`, `y`, `flags`))

proc `set_maximized`*(obj: Wl_shell_surface; `output`: Wl_output) =
  request(obj, 7, (`output`,))

proc `set_title`*(obj: Wl_shell_surface; `title`: string) =
  request(obj, 8, (`title`,))

proc `set_class`*(obj: Wl_shell_surface; `class`: string) =
  request(obj, 9, (`class`,))

method `ping`*(obj: Wl_shell_surface; `serial`: uint) {.base.} =
  raiseAssert("wl_shell_surface.ping not implemented")

method `configure`*(obj: Wl_shell_surface; `edges`: Wl_shell_surface_resize;
                    `width`: int; `height`: int) {.base.} =
  raiseAssert("wl_shell_surface.configure not implemented")

method `popup_done`*(obj: Wl_shell_surface) {.base.} =
  raiseAssert("wl_shell_surface.popup_done not implemented")

method dispatchEvent*(obj: Wl_shell_surface; msg: Message) =
  case msg.opcode
  of 0:
    var args: (uint,)
    unmarshal(obj, msg, args)
    obj.`ping`(args[0])
  of 1:
    var args: (Wl_shell_surface_resize, int, int)
    unmarshal(obj, msg, args)
    obj.`configure`(args[0], args[1], args[2])
  of 2:
    obj.`popup_done`()
  else:
    raise newUnknownEventError("wl_shell_surface", msg.opcode)

func face*(obj: Wl_surface): string =
  "wl_surface"

func version*(obj: Wl_surface): uint =
  6

proc `destroy`*(obj: Wl_surface) =
  request(obj, 0, ())

proc `attach`*(obj: Wl_surface; `buffer`: Wl_buffer; `x`: int; `y`: int) =
  request(obj, 1, (`buffer`, `x`, `y`))

proc `damage`*(obj: Wl_surface; `x`: int; `y`: int; `width`: int; `height`: int) =
  request(obj, 2, (`x`, `y`, `width`, `height`))

proc `frame`*(obj: Wl_surface; `callback`: Wl_callback) =
  request(obj, 3, (`callback`,))

proc `set_opaque_region`*(obj: Wl_surface; `region`: Wl_region) =
  request(obj, 4, (`region`,))

proc `set_input_region`*(obj: Wl_surface; `region`: Wl_region) =
  request(obj, 5, (`region`,))

proc `commit`*(obj: Wl_surface) =
  request(obj, 6, ())

method `enter`*(obj: Wl_surface; `output`: Wl_output) {.base.} =
  raiseAssert("wl_surface.enter not implemented")

method `leave`*(obj: Wl_surface; `output`: Wl_output) {.base.} =
  raiseAssert("wl_surface.leave not implemented")

proc `set_buffer_transform`*(obj: Wl_surface; `transform`: int) =
  request(obj, 7, (`transform`,))

proc `set_buffer_scale`*(obj: Wl_surface; `scale`: int) =
  request(obj, 8, (`scale`,))

proc `damage_buffer`*(obj: Wl_surface; `x`: int; `y`: int; `width`: int;
                      `height`: int) =
  request(obj, 9, (`x`, `y`, `width`, `height`))

proc `offset`*(obj: Wl_surface; `x`: int; `y`: int) =
  request(obj, 10, (`x`, `y`))

method `preferred_buffer_scale`*(obj: Wl_surface; `factor`: int) {.base.} =
  raiseAssert("wl_surface.preferred_buffer_scale not implemented")

method `preferred_buffer_transform`*(obj: Wl_surface;
                                     `transform`: Wl_output_transform) {.base.} =
  raiseAssert("wl_surface.preferred_buffer_transform not implemented")

method dispatchEvent*(obj: Wl_surface; msg: Message) =
  case msg.opcode
  of 0:
    var args: (Wl_output,)
    unmarshal(obj, msg, args)
    obj.`enter`(args[0])
  of 1:
    var args: (Wl_output,)
    unmarshal(obj, msg, args)
    obj.`leave`(args[0])
  of 2:
    var args: (int,)
    unmarshal(obj, msg, args)
    obj.`preferred_buffer_scale`(args[0])
  of 3:
    var args: (Wl_output_transform,)
    unmarshal(obj, msg, args)
    obj.`preferred_buffer_transform`(args[0])
  else:
    raise newUnknownEventError("wl_surface", msg.opcode)

func face*(obj: Wl_seat): string =
  "wl_seat"

func version*(obj: Wl_seat): uint =
  9

method `capabilities`*(obj: Wl_seat; `capabilities`: Wl_seat_capability) {.base.} =
  raiseAssert("wl_seat.capabilities not implemented")

proc `get_pointer`*(obj: Wl_seat; `id`: Wl_pointer) =
  request(obj, 0, (`id`,))

proc `get_keyboard`*(obj: Wl_seat; `id`: Wl_keyboard) =
  request(obj, 1, (`id`,))

proc `get_touch`*(obj: Wl_seat; `id`: Wl_touch) =
  request(obj, 2, (`id`,))

method `name`*(obj: Wl_seat; `name`: string) {.base.} =
  raiseAssert("wl_seat.name not implemented")

proc `release`*(obj: Wl_seat) =
  request(obj, 3, ())

method dispatchEvent*(obj: Wl_seat; msg: Message) =
  case msg.opcode
  of 0:
    var args: (Wl_seat_capability,)
    unmarshal(obj, msg, args)
    obj.`capabilities`(args[0])
  of 1:
    var args: (string,)
    unmarshal(obj, msg, args)
    obj.`name`(args[0])
  else:
    raise newUnknownEventError("wl_seat", msg.opcode)

func face*(obj: Wl_pointer): string =
  "wl_pointer"

func version*(obj: Wl_pointer): uint =
  9

proc `set_cursor`*(obj: Wl_pointer; `serial`: uint; `surface`: Wl_surface;
                   `hotspot_x`: int; `hotspot_y`: int) =
  request(obj, 0, (`serial`, `surface`, `hotspot_x`, `hotspot_y`))

method `enter`*(obj: Wl_pointer; `serial`: uint; `surface`: Wl_surface;
                `surface_x`: SignedDecimal; `surface_y`: SignedDecimal) {.base.} =
  raiseAssert("wl_pointer.enter not implemented")

method `leave`*(obj: Wl_pointer; `serial`: uint; `surface`: Wl_surface) {.base.} =
  raiseAssert("wl_pointer.leave not implemented")

method `motion`*(obj: Wl_pointer; `time`: uint; `surface_x`: SignedDecimal;
                 `surface_y`: SignedDecimal) {.base.} =
  raiseAssert("wl_pointer.motion not implemented")

method `button`*(obj: Wl_pointer; `serial`: uint; `time`: uint; `button`: uint;
                 `state`: Wl_pointer_button_state) {.base.} =
  raiseAssert("wl_pointer.button not implemented")

method `axis`*(obj: Wl_pointer; `time`: uint; `axis`: Wl_pointer_axis;
               `value`: SignedDecimal) {.base.} =
  raiseAssert("wl_pointer.axis not implemented")

proc `release`*(obj: Wl_pointer) =
  request(obj, 1, ())

method `frame`*(obj: Wl_pointer) {.base.} =
  raiseAssert("wl_pointer.frame not implemented")

method `axis_source`*(obj: Wl_pointer; `axis_source`: Wl_pointer_axis_source) {.
    base.} =
  raiseAssert("wl_pointer.axis_source not implemented")

method `axis_stop`*(obj: Wl_pointer; `time`: uint; `axis`: Wl_pointer_axis) {.
    base.} =
  raiseAssert("wl_pointer.axis_stop not implemented")

method `axis_discrete`*(obj: Wl_pointer; `axis`: Wl_pointer_axis;
                        `discrete`: int) {.base.} =
  raiseAssert("wl_pointer.axis_discrete not implemented")

method `axis_value120`*(obj: Wl_pointer; `axis`: Wl_pointer_axis;
                        `value120`: int) {.base.} =
  raiseAssert("wl_pointer.axis_value120 not implemented")

method `axis_relative_direction`*(obj: Wl_pointer; `axis`: Wl_pointer_axis;
    `direction`: Wl_pointer_axis_relative_direction) {.base.} =
  raiseAssert("wl_pointer.axis_relative_direction not implemented")

method dispatchEvent*(obj: Wl_pointer; msg: Message) =
  case msg.opcode
  of 0:
    var args: (uint, Wl_surface, SignedDecimal, SignedDecimal)
    unmarshal(obj, msg, args)
    obj.`enter`(args[0], args[1], args[2], args[3])
  of 1:
    var args: (uint, Wl_surface)
    unmarshal(obj, msg, args)
    obj.`leave`(args[0], args[1])
  of 2:
    var args: (uint, SignedDecimal, SignedDecimal)
    unmarshal(obj, msg, args)
    obj.`motion`(args[0], args[1], args[2])
  of 3:
    var args: (uint, uint, uint, Wl_pointer_button_state)
    unmarshal(obj, msg, args)
    obj.`button`(args[0], args[1], args[2], args[3])
  of 4:
    var args: (uint, Wl_pointer_axis, SignedDecimal)
    unmarshal(obj, msg, args)
    obj.`axis`(args[0], args[1], args[2])
  of 5:
    obj.`frame`()
  of 6:
    var args: (Wl_pointer_axis_source,)
    unmarshal(obj, msg, args)
    obj.`axis_source`(args[0])
  of 7:
    var args: (uint, Wl_pointer_axis)
    unmarshal(obj, msg, args)
    obj.`axis_stop`(args[0], args[1])
  of 8:
    var args: (Wl_pointer_axis, int)
    unmarshal(obj, msg, args)
    obj.`axis_discrete`(args[0], args[1])
  of 9:
    var args: (Wl_pointer_axis, int)
    unmarshal(obj, msg, args)
    obj.`axis_value120`(args[0], args[1])
  of 10:
    var args: (Wl_pointer_axis, Wl_pointer_axis_relative_direction)
    unmarshal(obj, msg, args)
    obj.`axis_relative_direction`(args[0], args[1])
  else:
    raise newUnknownEventError("wl_pointer", msg.opcode)

func face*(obj: Wl_keyboard): string =
  "wl_keyboard"

func version*(obj: Wl_keyboard): uint =
  9

method `keymap`*(obj: Wl_keyboard; `format`: Wl_keyboard_keymap_format;
                 `fd`: FD; `size`: uint) {.base.} =
  raiseAssert("wl_keyboard.keymap not implemented")

method `enter`*(obj: Wl_keyboard; `serial`: uint; `surface`: Wl_surface;
                `keys`: seq[uint32]) {.base.} =
  raiseAssert("wl_keyboard.enter not implemented")

method `leave`*(obj: Wl_keyboard; `serial`: uint; `surface`: Wl_surface) {.base.} =
  raiseAssert("wl_keyboard.leave not implemented")

method `key`*(obj: Wl_keyboard; `serial`: uint; `time`: uint; `key`: uint;
              `state`: Wl_keyboard_key_state) {.base.} =
  raiseAssert("wl_keyboard.key not implemented")

method `modifiers`*(obj: Wl_keyboard; `serial`: uint; `mods_depressed`: uint;
                    `mods_latched`: uint; `mods_locked`: uint; `group`: uint) {.
    base.} =
  raiseAssert("wl_keyboard.modifiers not implemented")

proc `release`*(obj: Wl_keyboard) =
  request(obj, 0, ())

method `repeat_info`*(obj: Wl_keyboard; `rate`: int; `delay`: int) {.base.} =
  raiseAssert("wl_keyboard.repeat_info not implemented")

method dispatchEvent*(obj: Wl_keyboard; msg: Message) =
  case msg.opcode
  of 0:
    var args: (Wl_keyboard_keymap_format, FD, uint)
    unmarshal(obj, msg, args)
    obj.`keymap`(args[0], args[1], args[2])
  of 1:
    var args: (uint, Wl_surface, seq[uint32])
    unmarshal(obj, msg, args)
    obj.`enter`(args[0], args[1], args[2])
  of 2:
    var args: (uint, Wl_surface)
    unmarshal(obj, msg, args)
    obj.`leave`(args[0], args[1])
  of 3:
    var args: (uint, uint, uint, Wl_keyboard_key_state)
    unmarshal(obj, msg, args)
    obj.`key`(args[0], args[1], args[2], args[3])
  of 4:
    var args: (uint, uint, uint, uint, uint)
    unmarshal(obj, msg, args)
    obj.`modifiers`(args[0], args[1], args[2], args[3], args[4])
  of 5:
    var args: (int, int)
    unmarshal(obj, msg, args)
    obj.`repeat_info`(args[0], args[1])
  else:
    raise newUnknownEventError("wl_keyboard", msg.opcode)

func face*(obj: Wl_touch): string =
  "wl_touch"

func version*(obj: Wl_touch): uint =
  9

method `down`*(obj: Wl_touch; `serial`: uint; `time`: uint;
               `surface`: Wl_surface; `id`: int; `x`: SignedDecimal;
               `y`: SignedDecimal) {.base.} =
  raiseAssert("wl_touch.down not implemented")

method `up`*(obj: Wl_touch; `serial`: uint; `time`: uint; `id`: int) {.base.} =
  raiseAssert("wl_touch.up not implemented")

method `motion`*(obj: Wl_touch; `time`: uint; `id`: int; `x`: SignedDecimal;
                 `y`: SignedDecimal) {.base.} =
  raiseAssert("wl_touch.motion not implemented")

method `frame`*(obj: Wl_touch) {.base.} =
  raiseAssert("wl_touch.frame not implemented")

method `cancel`*(obj: Wl_touch) {.base.} =
  raiseAssert("wl_touch.cancel not implemented")

proc `release`*(obj: Wl_touch) =
  request(obj, 0, ())

method `shape`*(obj: Wl_touch; `id`: int; `major`: SignedDecimal;
                `minor`: SignedDecimal) {.base.} =
  raiseAssert("wl_touch.shape not implemented")

method `orientation`*(obj: Wl_touch; `id`: int; `orientation`: SignedDecimal) {.
    base.} =
  raiseAssert("wl_touch.orientation not implemented")

method dispatchEvent*(obj: Wl_touch; msg: Message) =
  case msg.opcode
  of 0:
    var args: (uint, uint, Wl_surface, int, SignedDecimal, SignedDecimal)
    unmarshal(obj, msg, args)
    obj.`down`(args[0], args[1], args[2], args[3], args[4], args[5])
  of 1:
    var args: (uint, uint, int)
    unmarshal(obj, msg, args)
    obj.`up`(args[0], args[1], args[2])
  of 2:
    var args: (uint, int, SignedDecimal, SignedDecimal)
    unmarshal(obj, msg, args)
    obj.`motion`(args[0], args[1], args[2], args[3])
  of 3:
    obj.`frame`()
  of 4:
    obj.`cancel`()
  of 5:
    var args: (int, SignedDecimal, SignedDecimal)
    unmarshal(obj, msg, args)
    obj.`shape`(args[0], args[1], args[2])
  of 6:
    var args: (int, SignedDecimal)
    unmarshal(obj, msg, args)
    obj.`orientation`(args[0], args[1])
  else:
    raise newUnknownEventError("wl_touch", msg.opcode)

func face*(obj: Wl_output): string =
  "wl_output"

func version*(obj: Wl_output): uint =
  4

method `geometry`*(obj: Wl_output; `x`: int; `y`: int; `physical_width`: int;
                   `physical_height`: int; `subpixel`: int; `make`: string;
                   `model`: string; `transform`: int) {.base.} =
  raiseAssert("wl_output.geometry not implemented")

method `mode`*(obj: Wl_output; `flags`: Wl_output_mode; `width`: int;
               `height`: int; `refresh`: int) {.base.} =
  raiseAssert("wl_output.mode not implemented")

method `done`*(obj: Wl_output) {.base.} =
  raiseAssert("wl_output.done not implemented")

method `scale`*(obj: Wl_output; `factor`: int) {.base.} =
  raiseAssert("wl_output.scale not implemented")

proc `release`*(obj: Wl_output) =
  request(obj, 0, ())

method `name`*(obj: Wl_output; `name`: string) {.base.} =
  raiseAssert("wl_output.name not implemented")

method `description`*(obj: Wl_output; `description`: string) {.base.} =
  raiseAssert("wl_output.description not implemented")

method dispatchEvent*(obj: Wl_output; msg: Message) =
  case msg.opcode
  of 0:
    var args: (int, int, int, int, int, string, string, int)
    unmarshal(obj, msg, args)
    obj.`geometry`(args[0], args[1], args[2], args[3], args[4], args[5],
                   args[6], args[7])
  of 1:
    var args: (Wl_output_mode, int, int, int)
    unmarshal(obj, msg, args)
    obj.`mode`(args[0], args[1], args[2], args[3])
  of 2:
    obj.`done`()
  of 3:
    var args: (int,)
    unmarshal(obj, msg, args)
    obj.`scale`(args[0])
  of 4:
    var args: (string,)
    unmarshal(obj, msg, args)
    obj.`name`(args[0])
  of 5:
    var args: (string,)
    unmarshal(obj, msg, args)
    obj.`description`(args[0])
  else:
    raise newUnknownEventError("wl_output", msg.opcode)

func face*(obj: Wl_region): string =
  "wl_region"

func version*(obj: Wl_region): uint =
  1

proc `destroy`*(obj: Wl_region) =
  request(obj, 0, ())

proc `add`*(obj: Wl_region; `x`: int; `y`: int; `width`: int; `height`: int) =
  request(obj, 1, (`x`, `y`, `width`, `height`))

proc `subtract`*(obj: Wl_region; `x`: int; `y`: int; `width`: int; `height`: int) =
  request(obj, 2, (`x`, `y`, `width`, `height`))

func face*(obj: Wl_subcompositor): string =
  "wl_subcompositor"

func version*(obj: Wl_subcompositor): uint =
  1

proc `destroy`*(obj: Wl_subcompositor) =
  request(obj, 0, ())

proc `get_subsurface`*(obj: Wl_subcompositor; `id`: Wl_subsurface;
                       `surface`: Wl_surface; `parent`: Wl_surface) =
  request(obj, 1, (`id`, `surface`, `parent`))

func face*(obj: Wl_subsurface): string =
  "wl_subsurface"

func version*(obj: Wl_subsurface): uint =
  1

proc `destroy`*(obj: Wl_subsurface) =
  request(obj, 0, ())

proc `set_position`*(obj: Wl_subsurface; `x`: int; `y`: int) =
  request(obj, 1, (`x`, `y`))

proc `place_above`*(obj: Wl_subsurface; `sibling`: Wl_surface) =
  request(obj, 2, (`sibling`,))

proc `place_below`*(obj: Wl_subsurface; `sibling`: Wl_surface) =
  request(obj, 3, (`sibling`,))

proc `set_sync`*(obj: Wl_subsurface) =
  request(obj, 4, ())

proc `set_desync`*(obj: Wl_subsurface) =
  request(obj, 5, ())
