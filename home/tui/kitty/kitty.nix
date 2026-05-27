{ config, ... }:
let
  configPath = "${config.home.homeDirectory}/nix-config/home/tui/neovim/nvim";
in
{
  xdg.configFile."kitty".source = config.lib.file.mkOutOfStoreSymlink configPath;
}
