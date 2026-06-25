{ pkgs, ... }:
{
  home.packages = with pkgs; [
    thunar

    wl-clipboard
    cliphist # Replaces clipmenu for clipboard history

    grim
    slurp
    swappy # Optional: GUI editor to pipe screenshots into (like Flameshot's edit mode)

    networkmanagerapplet

    pavucontrol
    playerctl
    pamixer

    i3status
    rofi # Keeps compatibility with your existing Rofi themes

    kanshi
    swaylock-effects
    swayidle
    bibata-cursors

    mako
    libnotify

    xrandr
  ];
}
