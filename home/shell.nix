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
      export PS1='\W $ '
      eval "$(fzf --bash)"
      eval "$(zoxide init bash --cmd z)"

      # EXPORTS
      export QT_QPA_PLATFORM=xcb
      export PATH=$PATH:$GOPATH/bin

      PATH=$PATH:$(go env GOPATH)/bin

      # ALIASES
      alias bat='upower -i $(upower -e | grep battery) | grep -E "state|time to|percentage"'
      alias vim=nvim
      # ---------------------------------------
    '';
  };

  home.packages = with pkgs; [
    btop
    fastfetch
    zoxide
  ];
}
