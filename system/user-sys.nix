{
  pkgs,
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

  environment.systemPackages = with pkgs; [
    intel-compute-runtime # OpenCL for Kaby Lake GPU
    intel-media-driver # VAAPI Hardware Decoder
  ];

  services.ratbagd.enable = true; # Piper (Logitech Mouse Inteface)
  nixpkgs.config.android_sdk.accept_license = true;
}
