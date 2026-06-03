{ username, ... }:
{
  imports = [
    ../../hosts/zen/hardware-configuration.nix
    ../../system/network.nix
    ../../system/virtualization.nix
    ../../system/sys.nix
    ../../system/user-sys.nix
    ../../system/power.nix

    ../../modules/nixos/dev.nix
    # ../../modules/nixos/nginx/nginx.nix
    ../../modules/nixos/desktop-sway.nix  # switch back: desktop.nix
    # ../../modules/wireguard/wireguard.nix
    ../../modules/tailscale/tailscale.nix
    # ../../modules/zerotier/zerotier.nix
  ];
  system.stateVersion = "25.11";

  users.users."${username}" = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };
}
