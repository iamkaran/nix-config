{ pkgs, ... }:
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
}
