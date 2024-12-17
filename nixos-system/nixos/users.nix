# nixos/users.nix

{ config, ... }:
{
  # === === === === === === === === === === === === === === === === === === === === #
  #
  # ░█░█░█▀█░█▄█░█▀▀░░░█▄█░█▀█░█▀█░█▀█░█▀▀░█▀▀░█▀▄
  # ░█▀█░█░█░█░█░█▀▀░░░█░█░█▀█░█░█░█▀█░█░█░█▀▀░█▀▄
  # ░▀░▀░▀▀▀░▀░▀░▀▀▀░░░▀░▀░▀░▀░▀░▀░▀░▀░▀▀▀░▀▀▀░▀░▀
  #
  # Home Manager Configuration and Imports
  # ------------------------------------------------------------------------------- #

  # Enable Home Manager
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPkgs = true;

  # Import User's home.nix Files
  home-manager.users = {
    andrew = import ../home/users/andrew/home.nix;
    okinawa = import ../home/users/okinawa/home.nix;
  };

  # === === === === === === === === === === === === === === === === === === === === #
  #
  # ░█▀█░█▀█░█▀▄░█▀▄░█▀▀░█░█
  # ░█▀█░█░█░█░█░█▀▄░█▀▀░█▄█
  # ░▀░▀░▀░▀░▀▀░░▀░▀░▀▀▀░▀░▀
  #
  # Main User
  # ------------------------------------------------------------------------------- #

  # Declare Andrew
  users.users.andrew = {
    shell = pkgs.zsh;
    linger = true;
    isNormalUser = true;
    homeMode = "770";
    home = "/home/andrew";
    group = "andrew";
    extraGroups = [ "wheel" "mysql" "networkmanager" ];
    description = "Andrew Ross-Sermons, Main User";
    createHome = true;
  };

  # === === === === === === === === === === === === === === === === === === === === #
  #
  # ░█▀█░█░█░▀█▀░█▀█░█▀█░█░█░█▀█
  # ░█░█░█▀▄░░█░░█░█░█▀█░█▄█░█▀█
  # ░▀▀▀░▀░▀░▀▀▀░▀░▀░▀░▀░▀░▀░▀░▀
  #
  # TUI Style Desktop User
  # ------------------------------------------------------------------------------- #

  # Declare Okinawa
  users.users.okinawa = {
    shell = pkgs.zsh;
    isNormalUser = true;
    home = "/home/okinawa";
    extraGroups = [ "wheel" "andrew" "mysql" "networkmanager" ];
    description = "TUI Style Desktop User";
    createHome = false;
  };
}
