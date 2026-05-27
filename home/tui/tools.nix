{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Core

    tmux # Terminal Multiplexer
    hugo # Static Site Generator (Blogging)
    claude-code # Obsidian
    jdk17 # For gradlew tools
    docker
    docker-compose
    cobra-cli

    # Network Tools

    curl
    lsof
    wget
    nmap
    nettools # ifconfig
    arp-scan # Quick Network Mapping
    mosquitto # MQTT
    dig # DNS Tools
    inetutils
    scrcpy

    # File tools

    file
    git-filter-repo
    unzip
    zip
    gnumake
    tokei
    binwalk
    binutils

    # Search / navigation

    fzf
    fd
    ripgrep
    tree

    # System Tools

    inxi # Sys Info
    usbutils # lsusb
    picocom # UART / Serial
    powertop
    brightnessctl
    man-pages
    man-pages-posix

    # Other tools
    # yt-dlp
  ];
}
