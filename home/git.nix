{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    extraConfig = {
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
