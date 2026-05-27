{
  config,
  lib,
  username,
  ...
}:
{
  services.syncthing = {
    enable = true;
    user = "${username}"; # change if your username is different
    dataDir = "/home/${username}";
    configDir = "/home/${username}/.config/syncthing";

    # Opens Syncthing sync/discovery ports, not the GUI port
    openDefaultPorts = true;

    # Important for first setup: don't let rebuilds erase UI-added stuff
    overrideDevices = false;
    overrideFolders = false;
  };
}
