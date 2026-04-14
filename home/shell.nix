{
  pkgs,
  ...
}:
{
  # .bashrc
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      # ------------NIX-MANAGED----------------
      # EVAL's
      eval "$(starship init bash)"
      eval "$(fzf --bash)"

      # EXPORTS
      export DEV='/etc/nixos/modules/dev.nix'
      export HM='/etc/nixos/home.nix'
      export NIX='/etc/nixos'
      export QT_QPA_PLATFORM=xcb

      # ALIASES
      alias bat='upower -i $(upower -e | grep battery) | grep -E "state|time to|percentage"'
      # ---------------------------------------
    '';
  };

  # Extensions
  programs.zsh.enable = true;

  home.packages = with pkgs; [
    starship
    btop
    htop
    fastfetch
  ];
}
