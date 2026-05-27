{
  pkgs,
  ...
}:

{
  # Services
  services.openssh.enable = true;
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;

  # Nix Settings
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;

  # -------------Fonts-&-Timezone-------------
  fonts = {
   enableDefaultPackages = true;

    packages = with pkgs; [
      nerd-fonts.iosevka
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "Iosevka Nerd Font Mono" ];
      };
    };
  };

  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "Asia/Kolkata";

  # ------------------OTHERS---------------------

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = [ pkgs.cnijfilter2 ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.pipewire.wireplumber.extraConfig = {
    "10-disable-bluetooth-hfp" = {
      "wireplumber.settings" = {
        "bluetooth.autoswitch-to-headset-profile" = false;
      };
    };
  };

  # Enable dconf for EasyEffects settings storage
  # programs.dconf.enable = true;
  #
  # # Ensure the package is installed
  # environment.systemPackages = [ pkgs.easyeffects ];
  #
  # systemd.user.services.easyeffects = {
  #   description = "EasyEffects daemon";
  #   requires = [ "pipewire.service" ];
  #   after = [ "pipewire.service" ];
  #   wantedBy = [ "graphical-session.target" ];
  #   partOf = [ "graphical-session.target" ];
  #   serviceConfig = {
  #     # Use --service-mode for v8.x instead of --daemon
  #     ExecStart = "${pkgs.easyeffects}/bin/easyeffects --gapplication-service";
  #     ExecStop = "${pkgs.easyeffects}/bin/easyeffects --quit";
  #     Restart = "on-failure";
  #     RestartSec = 5;
  #   };
  # };
  # -----------------NERD-STUFF------------------

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Graphics
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # Kaby Lake
      libvdpau-va-gl
    ];
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };

  nixpkgs.hostPlatform = "x86_64-linux";
}
