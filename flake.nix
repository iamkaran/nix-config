{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    let
      username = "citadel";
      mainHost = "citadel";
    in
    {
      nixosConfigurations = {
        ${username} = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs username mainHost; };
          modules = [
            ./hosts/citadel/default.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = { inherit inputs username mainHost; };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${username} = {
                imports = [
                  ./home/default.nix
                  ./home/shell.nix
                  ./home/git.nix
                  ./home/tui/tools.nix
                  ./home/gui/de/hyprland.nix
                  ./home/gui/apps.nix
                  ./home/tui/neovim/neovim.nix
                ];
              };
            }
          ];
        };
      };
    };
}
