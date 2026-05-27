{ pkgs, ... }:
{
  # ── Sway ──────────────────────────────────────────────────────────────────
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # Required for GTK apps to theme correctly
  };

  # ── Display Manager ───────────────────────────────────────────────────────
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # ── Portals (Crucial for Screen Sharing) ──────────────────────────────────
  xdg.portal = {
    enable = true;
    wlr.enable = true; # Replaces the Hyprland portal
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    config.common.default = "*";
  };

  # ── Polkit (Keep this exactly as is) ──────────────────────────────────────
  security.polkit.enable = true;
  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  # ── Wayland Environment Variables ─────────────────────────────────────────
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    SDL_VIDEODRIVER = "wayland";
    GDK_BACKEND = "wayland,x11";
    
    # Updated for Sway
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "sway"; 
    XDG_SESSION_DESKTOP = "sway"; 
    
    # Cursor settings (Hyprcursor vars removed)
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
    LIBVA_DRIVER_NAME = "iHD";
  };
}
