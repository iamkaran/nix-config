{ username, ... }:
{
  networking.wg-quick.interfaces.lca = {
    configFile = "/etc/wireguard/${username}.conf";
    autostart = false;
  };
}
