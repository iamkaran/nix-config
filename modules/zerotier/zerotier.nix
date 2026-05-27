{ config, ... }:
{
  services.zerotierone = {
    enable = true;
  };
  
  networking.firewall.allowedTCPPorts = [
    9993
  ];
}
