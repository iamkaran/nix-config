{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user.name = "iamkaran";
      user.email = "kforkaranveer@gmail.com";
    };
  };
  home.packages = with pkgs; [
    lazygit
    gh
  ];
}
