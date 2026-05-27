{ username, ... }:
{
  networking.wg-quick.interfaces.lca = {
    configFile = "/etc/wireguard/lca.conf";
    autostart = false;
  };
}
