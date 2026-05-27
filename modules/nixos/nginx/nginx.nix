{ pkgs, ... }:

{
  services.nginx = {
    enable = true;
    package = pkgs.nginxMainline;

    virtualHosts."localhost" = {
      listen = [
        {
          addr = "0.0.0.0";
          port = 8080;
        }
      ];

      # =========================
      # MAIN PROXY (ThingsBoard Cloud)
      # =========================
      locations."/" = {
        proxyPass = "http://192.168.1.9:8081";

        extraConfig = ''
          proxy_ssl_server_name on;

          # Required headers for upstream compatibility
          proxy_set_header Host 192.168.1.9:8081;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Forwarded-Proto $scheme;

          # Prevent compression issues with sub_filter
          proxy_set_header Accept-Encoding "";

          proxy_http_version 1.1;
          proxy_set_header Connection "";

          proxy_buffering off;
        '';
      };

      # =========================
      # CSS OVERRIDES (your control layer)
      # =========================

      locations."= /custom.css" = {
        alias = "/opt/tb-override/active/assets/custom.css";

        extraConfig = ''
          add_header Cache-Control "no-store";
          add_header Content-Type text/css;
        '';
      };

      locations."= /rules.css" = {
        alias = "/opt/tb-override/rules.css";

        extraConfig = ''
          add_header Cache-Control "no-store";
          add_header Content-Type text/css;
        '';
      };

      locations."= /assets/logo_title_white.svg" = {
        alias = "/opt/tb-override/active/assets/logo_title_white.svg";

        extraConfig = ''
          add_header Cache-Control "no-store";
        '';
      };

      extraConfig = ''
        sub_filter_once on;
        sub_filter_types text/html;

        # Inject CSS safely into HTML head
        sub_filter '</head>' '<link rel="stylesheet" href="/custom.css"><link rel="stylesheet" href="/rules.css"></head>';
      '';
    };
  };

  # Allow access
  networking.firewall.allowedTCPPorts = [ 8080 ];
}
