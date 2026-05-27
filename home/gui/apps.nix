{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Daily
    brave
    ptyxis
    piper
    obsidian
    telegram-desktop
    google-chrome
    zathura
    obs-studio

    # Linux stuff
    kitty
    ghostty
    wireshark
    ghidra
    
    burpsuite

    # IDE
    android-studio
    android-tools

    # I hate

    libreoffice-fresh
    hunspell
    hunspellDicts.en_US
  ];
}
