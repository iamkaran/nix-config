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
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  # -----------------NERD-STUFF------------------

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Graphics
  # hardware.graphics = {
  #   enable = true;
  #   extraPackages = with pkgs; [
  #     intel-compute-runtime-legacy1
  #   ];
  # };

  nixpkgs.hostPlatform = "x86_64-linux";
}
