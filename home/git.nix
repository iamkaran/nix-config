{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user.name = "iamkaran";
      user.email = "kforkaranveer@gmail.com";
    };
    ignores = [ "Session.vim" ];
  };
  home.packages = with pkgs; [
    lazygit
    gh
  ];
}
