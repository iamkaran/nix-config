{ config, pkgs, lib, ... }:

{
  # X11 base (common for GNOME-on-Xorg / i3 / etc.)
  services.xserver.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}
