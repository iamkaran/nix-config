{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim

    # LSP & Tools
    clang-tools
    gotools
    gopls
    golangci-lint
    gofumpt
    goimports-reviser
    nixd
    nixfmt
    stylua
  ];
}
