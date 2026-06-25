{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    # Daily
    brave
    firefox
    piper
    obsidian
    zathura
    obs-studio

    wireshark

    # IDE
    android-studio
    android-tools

    # I hate
    libreoffice-fresh
    hunspell
    hunspellDicts.en_US
  ];

}
