# flake.nix

# This flake is heavily commented as a template and learning exercise

{
  # Description: Provides metadata for the flake
  description = "Modular NixOS using Home Manager";

  # inputs: Defines dependencies (other flakes) that this flake relies on
  inputs = {
    # The main NixOS package source, here set to unstable
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager flake
    home-manager = {
      # url is set to the master (latest) branch
      url = "github:nix-community/home-manager/master";
      # 'follows' acts as an inheritance rule to avoid
      # problems caused by different nixpkgs versions
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # outputs: Defines what this flake provides when built
  # May include NixOS configurations, Home Manager configurations, etc.
  # @inputs includes all flakes from inputs, which would
  # have to be manually listed otherwise
  outputs = { self, ... }@inputs:
  # let ... in is used to set variables to avoid repetition
  let
    # Target system architecture
    system = "x86_64-linux";
  in {
    # nixosConfigurations: System-wide configurations
    nixosConfigurations = {
      # TODO replace my-hostname
      my-hostname = nixpkgs.lib.nixosSystem {
        # Use system architecture defined in let statement
        inherit system;

        # Define pkgs explicitly
        pkgs = import nixpkgs { inherit system; };

        # modules: A list of .nix files that define the system
        modules = [
          ./nixos/configuration.nix # Main entry point for NixOS configuration

          # Use home-manager as a NixOS module
          (import home-manager { inherit system pkgs; }).nixosModules.home-manager {
            # Use global and user packages
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPkgs = true;
            # Define users through home.nix imports
            home-manager.users.default-user = import ./home/users/default-user/home.nix;
          }
        ];
      };
    };
  };
}
