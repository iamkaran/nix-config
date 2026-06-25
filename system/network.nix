{
  config,
  lib,
  username,
  ...
}:

{
  networking.hostName = "${username}"; # Define your hostname.
  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;
  networking.firewall.allowedTCPPorts = [
  ];
}
