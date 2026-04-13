{ config, pkgs, ... }:

{
  # Enable NGINX
  services.nginx.enable = true;

  # Firewall Allowed ports
  networking.firewall.allowedTCPPorts = [ 80 443 ];

  # HTTPS
  security.acme.defaults= {
    email = "idontwantto@givemyemail.com";
  };

  security.acme.acceptTerms = true;

  services.nginx.virtualHosts = let
    SSL = {
      enableACME = true;
      forceSSL = true;
    }; in {
      "app.lcaforyou.com" = (SSL // {
        locations."/".proxyPass = "http://localhost:8080/";

	serverAliases = [
	  "app.lcaforyou.com"
	];
    });
  };
}
