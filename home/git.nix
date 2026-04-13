{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lazygit
    git
    gh
  ];

  programs.git.enable = true;
}
