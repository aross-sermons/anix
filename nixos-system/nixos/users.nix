# nixos/users.nix

{ config, pkgs, ... }:
{
  # === === === === === === === === === === === === === === === === === === === === #
  #
  # ░█▀▀░█▀▄░█▀█░█░█░█▀█░█▀▀
  # ░█░█░█▀▄░█░█░█░█░█▀▀░▀▀█
  # ░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀░░░▀▀▀
  #
  # Group Definitions
  # ------------------------------------------------------------------------------- #

  users.groups = {
    andrew = { };
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
    createHome = true;
  };
}
