{
  username,
  ...
}:

{
  users.users."${username}" = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    # packages = with pkgs; [];
  };

  services.ratbagd.enable = true; # Piper (Logitech Mouse Inteface)
  nixpkgs.config.android_sdk.accept_license = true;
}
