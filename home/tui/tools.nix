{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Applications
    tmux
    hugo
    docker
    docker-compose

    # Network Tools
    curl
    nettools
    arp-scan
    lsof
    mosquitto
    wget
    dig
    nmap

    # File tools
    file
    unzip
    zip
    gnumake

    # Other tools
    usbutils
    powertop
    kanshi
  ];
}
