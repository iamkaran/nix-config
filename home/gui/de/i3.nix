{ config, pkgs, lib, ... }:

{
  # Disable GDM
  services.displayManager.gdm.enable = false;

  # Enable LightDM (correct path)
  services.xserver.displayManager.lightdm.enable = true;

  # i3
  services.xserver.windowManager.i3 = {
    enable = true;
    extraPackages = with pkgs; [
      i3lock
      i3blocks
      rofi
      feh
    ];
  };

  services.displayManager.defaultSession = "none+i3";

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    pavucontrol
    flameshot
    xclip
  ];
}
