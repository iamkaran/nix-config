{ username, ... }:
{
  imports = [
    ../../hosts/citadel/hardware-configuration.nix
    ../../system/network.nix
    ../../system/sys.nix
    ../../system/user-sys.nix
    ../../system/power.nix
    ../../system/vm.nix

    ../../modules/nixos/dev.nix
    ../../modules/nixos/desktop.nix
    ../../modules/wireguard/wireguard.nix
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
