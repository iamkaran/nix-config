{
  ...
}:
{

  # Power
  services.upower.enable = true;
  # ── CPU Governor ──────────────────────────────────────────
  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };
  # ── TLP (Disks, USB, PCI, WiFi) ───────────────────────────
  services.tlp = {
    enable = true;
    settings = {
      # Let auto-cpufreq handle CPU — don't conflict
      CPU_SCALING_GOVERNOR_ON_BAT = "";
      CPU_SCALING_GOVERNOR_ON_AC = "";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_BOOST_ON_BAT = 0;
      DISK_APM_LEVEL_ON_BAT = "128";
      SATA_LINKPWR_ON_BAT = "min_power";
      WIFI_PWR_ON_BAT = "on";
      RUNTIME_PM_ON_BAT = "auto";
      # Charge threshold — saves long-term battery health
      START_CHARGE_THRESH_BAT0 = 20;
      STOP_CHARGE_THRESH_BAT0 = 95;
    };
  };
  # ── Powertop auto-tune on boot ─────────────────────────────
  powerManagement.powertop.enable = true;
  # ── Kernel params ─────────────────────────────────────────
  boot.kernelParams = [
    "mem_sleep_default=deep" # S3 suspend — better battery on sleep
  ];
  # ── zram swap (no SSD wear) ───────────────────────────────
  zramSwap.enable = true;
}
