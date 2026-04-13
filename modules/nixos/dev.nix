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
  ];
}
