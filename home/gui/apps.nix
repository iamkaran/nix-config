{ pkgs, ... }:
{
  home.packages = with pkgs; [
    brave
    obsidian
    ptyxis
    piper
    kitty
    wireshark

    android-studio
    android-tools

    davinci-resolve

    libreoffice-fresh
    hunspell
    hunspellDicts.en_US
  ];
}
