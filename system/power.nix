{ pkgs, ... }:
{
  # Enable UPower service for battery telemetry
  services.upower.enable = true;

  # ── TLP Power Management ──────────────────────────────────
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      # CPU_SCALING_MIN_FREQ_ON_AC = 400000;
      # CPU_SCALING_MAX_FREQ_ON_AC = 1800000; # Cap at 1.8 GHz instead of letting it boost to 3.6 GHz

      CPU_BOOST_ON_BAT = 0;
      CPU_BOOST_ON_AC = 0; 
      
      DISK_APM_LEVEL_ON_BAT = "129";
      SATA_LINKPWR_ON_BAT = "min_power";
      WIFI_PWR_ON_BAT = "on";
      RUNTIME_PM_ON_BAT = "auto";
      
      # FIX: Changed from BAT1 to BAT0 to target your actual Dell battery
      START_CHARGE_THRESH_BAT0 = 20;
      STOP_CHARGE_THRESH_BAT0 = 95;
    };
  };

  # ── Kernel Configurations ─────────────────────────────────
  boot.kernelParams = [
    "mem_sleep_default=deep" 
    "processor.ignore_ppc=1"  # Instructs kernel to refuse ACPI throttling requests
  ];

  # Forces initialization of the Model-Specific Register module at boot
  boot.kernelModules = [ "msr" ];

  # ── Systemd Automation: Volatile MSR Reset ────────────────
  systemd.services.disable-bd-prochot = {
    description = "Override Dell BD PROCHOT Hardware Throttling Lock";
    after = [ "systemd-modules-load.service" ];
    wantedBy = [ "multi-user.target" "post-resume.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.writeShellScript "disable-bd-prochot" ''
        for msr_path in /dev/cpu/[0-9]*/msr; do
          if [ -e "$msr_path" ]; then
            cpu_num=$(basename "$(dirname "$msr_path")" | sed 's/cpu//')
            current_val=$(${pkgs.msr-tools}/bin/rdmsr -p "$cpu_num" 0x1FC)
            new_val=$(printf '0x%X' $((0x$current_val & ~1)))
            ${pkgs.msr-tools}/bin/wrmsr -p "$cpu_num" 0x1FC "$new_val"
          fi
        done
      ''}";
      RemainAfterExit = true;
    };
  };

  # ── Swap Profile ──────────────────────────────────────────
  zramSwap.enable = true;
}
