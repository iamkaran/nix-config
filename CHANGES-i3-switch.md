# Switch: Hyprland → i3

Date: 2026-05-01

## What changed

### New file: `modules/nixos/desktop-i3.nix`
System-level i3/X11 config (equivalent to `modules/nixos/desktop.nix` for Hyprland).
Enables: xserver, i3 window manager, SDDM (X11 session), xdg-portal-gtk, polkit.

### Modified file: `home/gui/de/i3.nix`
Rewritten from a NixOS system module into a home-manager packages module
(equivalent to `home/gui/de/hyprland.nix`).

Tool mapping from Hyprland → i3:
- wl-clipboard + cliphist  →  xclip + clipmenu
- grimblast + slurp        →  flameshot
- waybar                   →  polybar
- hyprpaper                →  feh
- hypridle                 →  xautolock
- hyprlock                 →  i3lock-color
- (built-in compositor)    →  picom
- rofi, dunst, pavucontrol, playerctl, pamixer,
  thunar, bibata-cursors, networkmanagerapplet,
  libnotify                →  same packages (unchanged)

### Modified file: `hosts/citadel/default.nix`
Swapped import:
- Before: `../../modules/nixos/desktop.nix`
- After:  `../../modules/nixos/desktop-i3.nix`

### Modified file: `flake.nix`
Swapped home-manager import:
- Before: `./home/gui/de/hyprland.nix`
- After:  `./home/gui/de/i3.nix`

---

## How to roll back to Hyprland

Two lines to change:

**`hosts/citadel/default.nix`** — revert the desktop import:
```
../../modules/nixos/desktop.nix
```

**`flake.nix`** — revert the home-manager import:
```
./home/gui/de/hyprland.nix
```

Then rebuild:
```
sudo nixos-rebuild switch --flake .#citadel
```

---

## Files left untouched (safe to delete this note once stable)
- `modules/nixos/desktop.nix`     — Hyprland system config, untouched
- `home/gui/de/hyprland.nix`      — Hyprland HM packages, untouched
- `home/gui/de/x11.nix`           — folded into desktop-i3.nix, can be ignored
