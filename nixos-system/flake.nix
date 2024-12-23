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

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
        permittedInsecurePackages = [
          "electron-27.3.11"
        ];
      };
    };
  in {
    nixosConfigurations.anix = nixpkgs.lib.nixosSystem {
      inherit system;
      inherit pkgs;

      modules = [
        ./nixos/configuration.nix

        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users = {
              andrew = import ./home/users/andrew/home.nix;
              okinawa = import ./home/users/okinawa/home.nix;
            };
          };
        }

#        (import home-manager { inherit system pkgs; }).nixosModules.home-manager {
#          home-manager = {
#            useGlobalPkgs = true;
#            useUserPkgs = true;
#            users = {
#              andrew = import ./home/users/andrew/home.nix;
#              okinawa = import ./home/users/okinawa/home.nix;
#            };
#          };
#        }
      ];
    };
  };
}
