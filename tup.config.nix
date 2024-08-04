{ lib, pkgs, ... }:

{
  WAYLAND_XML = "/home/repo/wayland/protocol/wayland.xml";
  XDG_SHELL_XML = "${pkgs.wayland-protocols}/share/wayland-protocols/stable/xdg-shell/xdg-shell.xml";
}
