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

  # ── Wayland Environment Variables ─────────────────────────────────────────
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    SDL_VIDEODRIVER = "wayland";
    GDK_BACKEND = "wayland,x11";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
    HYPRCURSOR_THEME = "Bibata-Modern-Classic";
    HYPRCURSOR_SIZE = "24";
  };
}
