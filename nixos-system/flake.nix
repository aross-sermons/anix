# flake.nix

{
  description = "Modular NixOS system using Home manager";

  inputs = {
    # Nixpkgs (unstable channel)
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.anix = nixpkgs.lib.nixsosSystem {
      inherit system;
      
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      modules = [
        ./nixos/configuration.nix

        (import home-manager { inherit system pkgs; }).nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPkgs = true;
            users = {
              andrew = import ./home/users/andrew/home.nix;
              okinawa = import ./home/users/okinawa/home.nix;
            };
          };
        }
      ];
    };
  };
}
