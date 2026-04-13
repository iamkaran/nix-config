{
  config,
  pkgs,
  lib,
  ...
}:

let
  isGnome = config.services.desktopManager.gnome.enable or false;
in
{
  services.displayManager.defaultSession = "gnome";
  services.xserver.displayManager.lightdm.enable = false;
  services.xserver.windowManager.i3.enable = false;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Optional (leave default if you want): forces Xorg instead of Wayland
  # services.displayManager.gdm.wayland = false;

  programs.dconf.enable = true;

  # Optional "nice to have", still low-maintenance
  environment.systemPackages = with pkgs; [
    gnome-tweaks
    gnome-extension-manager
  ];

  # Optional: remove ONLY the games (still basically default GNOME)
  environment.gnome.excludePackages = with pkgs; [
    atomix
    hitori
    iagno
    tali
  ];

  xdg.portal = {
    enable = true;
    extraPortals = lib.unique (
      with pkgs; [ xdg-desktop-portal-gtk ] ++ lib.optionals isGnome [ xdg-desktop-portal-gnome ]
    );
    config.common.default = if isGnome then "gnome" else "gtk";
  };
}
