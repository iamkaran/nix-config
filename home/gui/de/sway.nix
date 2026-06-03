{ pkgs, ... }:
{
  # ── Packages ──────────────────────────────────────────────────────────────
  home.packages = with pkgs; [
    # File manager
    thunar

    # Clipboard (Wayland native)
    wl-clipboard
    cliphist # Replaces clipmenu for clipboard history

    # Screenshot (Wayland native)
    grim
    slurp
    swappy # Optional: GUI editor to pipe screenshots into (like Flameshot's edit mode)

    # Networking (tray)
    networkmanagerapplet

    # Audio control
    pavucontrol
    playerctl
    pamixer

    # Bar & Launcher (Wayland native)
    waybar
    rofi # Keeps compatibility with your existing Rofi themes

    # Wallpaper, Lock, Idle & Displays
    swaybg
    kanshi
    swaylock-effects
    swayidle
    bibata-cursors

    # Notifications
    mako
    libnotify

    # Others
    xorg.xrandr # 1.8.9
  ];
}
