{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user.name = "iamkaran";
      user.email = "your@email.com";
    };
  };

  home.packages = with pkgs; [
    lazygit
    git
    gh
  ];
}
