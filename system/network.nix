{
  config,
  lib,
  username,
  ...
}:

{
  # Networking
  networking.hostName = "${username}"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [
    8000
    80
    443
  ];
  # networking.hosts = {
  #   "127.0.0.1" = [ "www.youtube.com" ];
  # };
}
