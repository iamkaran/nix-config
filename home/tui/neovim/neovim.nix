{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Neovim Binary - Installed directly, no config strings attached
    neovim

    # LSP & Tools
    clang-tools # provides clangd (C/C++)
    gotools     # provides goimports (Go formatter)

    # # LSP (already installed system-wide, uncomment if needed)
    # lua-language-server
    # nil
    # stylua
    # gopls
  ];

  # REMOVED: programs.neovim block completely gone.
  # REMOVED: xdg.configFile."nvim" block completely gone.
}
