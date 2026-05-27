{ pkgs, ... }:
{
  # ── i3 / X11 ──────────────────────────────────────────────────────────────
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
    windowManager.i3.enable = true;
  };

  # ── Display Manager ───────────────────────────────────────────────────────
  services.displayManager.sddm.enable = true;
  services.displayManager.defaultSession = "none+i3";

  # ── Portals ───────────────────────────────────────────────────────────────
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };

  # ── Polkit ────────────────────────────────────────────────────────────────
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

  # ── Cursor ────────────────────────────────────────────────────────────────
  environment.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
  };
}
