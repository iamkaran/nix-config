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
    nodejs
    kotlin-native
    nixd
    nixfmt
    stylua
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };

  documentation = {
      enable = true;
      dev.enable = true;
      man.enable = true;
      man.generateCaches = true;
  };

}
