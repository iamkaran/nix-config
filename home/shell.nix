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
      # eval "$(starship init bash)"
      export PS1='\W $ '
      eval "$(fzf --bash)"
      eval "$(zoxide init bash --cmd z)"

      # EXPORTS
      export DEV='/etc/nixos/modules/dev.nix'
      export HM='/etc/nixos/home.nix'
      export NIX='/etc/nixos'
      export QT_QPA_PLATFORM=xcb
      export PATH=$PATH:$GOPATH/bin

      # ALIASES
      alias bat='upower -i $(upower -e | grep battery) | grep -E "state|time to|percentage"'
      alias e-book='~/read.sh'
      alias vim=nvim
      # ---------------------------------------
    '';
  };

  home.packages = with pkgs; [
    starship
    btop
    htop
    fastfetch
    slurp
    zoxide
  ];
}
