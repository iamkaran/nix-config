{ config, pkgs, ... }:
let
  configPath = "${config.home.homeDirectory}/nix-config/home/tui/neovim/nvim";
in
{
  home.packages = with pkgs; [
    # LSP
    lua-language-server
    nil
    nixfmt
    alejandra
    stylua
    shfmt

    # nvim dependencies
    glib
    tree-sitter

    # Clipboard
    xclip
    wl-clipboard

    # Search
    fzf
    ripgrep
    tree
    fd
  ];

  programs.neovim = {
    defaultEditor = true;
    enable = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = false;
  };

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink configPath;
}
