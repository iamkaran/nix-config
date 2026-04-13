{
  pkgs,
  ...
}:
{
  # ── Packages ──────────────────────────────────────────────────────────────
  home.packages = with pkgs; [
    # Utilities
    thunar

    # Clipboard
    wl-clipboard
    cliphist

    # Screenshot & Recording
    grimblast
    slurp

    # Networking (Wayland tray)
    networkmanagerapplet

    # Audio control
    pavucontrol
    playerctl

    # Bar & Launcher
    waybar
    rofi
    pamixer

    # Wallpaper & Lock
    hyprpaper
    hypridle
    hyprlock
    bibata-cursors

    # Notifications
    dunst
    libnotify
  ];
}
