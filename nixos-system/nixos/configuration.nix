# nixos/configuration.nix

{ config, ... }:
{
  # === === === === === === === === === === === === === === === === === === === === #
  #
  # ░▀█▀░█▄█░█▀█░█▀█░█▀▄░▀█▀░█▀▀
  # ░░█░░█░█░█▀▀░█░█░█▀▄░░█░░▀▀█
  # ░▀▀▀░▀░▀░▀░░░▀▀▀░▀░▀░░▀░░▀▀▀
  #
  # Import Statement for Other .nix Files
  # ------------------------------------------------------------------------------- #

  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./env-vars.nix
    ./services.nix
    ./users.nix
  ];

  # === === === === === === === === === === === === === === === === === === === === #
  #
  # ░█▀█░▀█▀░█░█░█▀█░█░█░█▀▀░█▀▀░░░█▀█░█▀█░▀█▀░▀█▀░█▀█░█▀█░█▀▀
  # ░█░█░░█░░▄▀▄░█▀▀░█▀▄░█░█░▀▀█░░░█░█░█▀▀░░█░░░█░░█░█░█░█░▀▀█
  # ░▀░▀░▀▀▀░▀░▀░▀░░░▀░▀░▀▀▀░▀▀▀░░░▀▀▀░▀░░░░▀░░▀▀▀░▀▀▀░▀░▀░▀▀▀
  #
  # Essential Nix Options
  # ------------------------------------------------------------------------------- #

  # StateVersion
  system.stateVersion = "24.11"; # DO NOT CHANGE

  # Boot/Kernel Options
  boot = {
    kernelParams = [ ];
    # CHECK THIS
    kernelPackages = pkgs.linuxPackages_latest;
    initrd.verbose = true; # Disable for silent boot
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    consoleLogLevel = 4; # Set to 0 for silent boot
  };

  # Hardware Options
  hardware = {
    firmware = [ pkgs.linuxFirmware ];
    graphics.enable = true;
    graphics.enable32Bit = true;
    cpu.intel.updateMicrocode = true;
    bluetooth.enable = true;
    enableRedistributableFirmware = true;
  };

  # Set Timezone and Localization
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  # Network Management
  networking = {
    hostName = "anix";
    networkmanager.enable = true;
  };
}
