{
  ...
}:
{
  # Power
  services.upower.enable = true;

  # ── TLP (Comprehensive Power Management) ──────────────────
  services.tlp = {
    enable = true;
    settings = {
      # Native CPU scaling (Replaces auto-cpufreq)
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_BOOST_ON_BAT = 0; # Disabled on battery for better thermals
      CPU_BOOST_ON_AC = 1;
      
      DISK_APM_LEVEL_ON_BAT = "129";
      SATA_LINKPWR_ON_BAT = "min_power";
      WIFI_PWR_ON_BAT = "on";
      RUNTIME_PM_ON_BAT = "auto";
      
      # Charge threshold — saves long-term battery health
      START_CHARGE_THRESH_BAT1 = 20;
      STOP_CHARGE_THRESH_BAT1 = 95;
    };
  };

  # powerManagement.powertop.enable = true;

  # ── Kernel params ─────────────────────────────────────────
  boot.kernelParams = [
    "mem_sleep_default=deep" # S4 suspend — better battery on sleep
  ];

  # ── zram swap (no SSD wear) ───────────────────────────────
  zramSwap.enable = true;
}
