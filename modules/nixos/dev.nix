{
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    # Packages & Libraries
    libXxf86vm
    glib
    nodejs

    # Compilers & Langs
    kotlin-native
    python3
    go
    gcc
    gdb
    jdk21
    openjfx21
  ];

  programs.steam = {
    enable = false;
    remotePlay.openFirewall = true;
  };
  services.usbmuxd.enable = true;

  documentation = {
    enable = true;
    dev = { enable = true; };
    man = {
      mandoc.enable = true;
      man-db.enable = false;
      cache.enable = true;
    };
  };
}
