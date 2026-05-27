{ pkgs, ... }:
{
  # ── Packages ──────────────────────────────────────────────────────────────
  home.packages = with pkgs; [
    # File manager
    thunar

    # Clipboard
    xclip
    clipmenu

    # Screenshot
    flameshot

    # Networking (tray)
    networkmanagerapplet

    # Audio control
    pavucontrol
    playerctl
    pamixer

    # Bar & Launcher
    polybar
    rofi

    # Wallpaper, Lock & Idle
    feh
    autorandr
    i3lock-color
    xautolock
    bibata-cursors

    # Compositor
    picom

    # Notifications
    dunst
    libnotify
  ];
}
