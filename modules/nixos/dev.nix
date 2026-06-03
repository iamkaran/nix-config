{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    python3
    go
    gopls
    golangci-lint
    gofumpt
    goimports-reviser
    gcc
    gdb
    jdk21
    openjfx21
    libXxf86vm
    glib
    nodejs
    kotlin-native
    nixd
    nixfmt
    stylua
    heroic
    gamescope
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };

  # modules/nixos/dev.nix
  documentation = {
    enable = true;
    man = {
      mandoc.enable = true;
      man-db.enable = false;
      cache.enable = true;
    };
  };

}
