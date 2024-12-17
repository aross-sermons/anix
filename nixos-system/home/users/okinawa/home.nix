# home/users/okinawa/home.nix

# The home.nix configuration file for okinawa

{ config, ... }:
{
  home = {
    # === === === === === === === === === === === === === === === === === === === === #
    #
    # ░█░█░█▀█░█▄█░█▀▀░░░█▄█░█▀█░█▀█░█▀█░█▀▀░█▀▀░█▀▄
    # ░█▀█░█░█░█░█░█▀▀░░░█░█░█▀█░█░█░█▀█░█░█░█▀▀░█▀▄
    # ░▀░▀░▀▀▀░▀░▀░▀▀▀░░░▀░▀░▀░▀░▀░▀░▀░▀░▀▀▀░▀▀▀░▀░▀
    #
    # Home Manager Options and Imports
    # ------------------------------------------------------------------------------- #

    # Home Options
    username = "okinawa";
    homeDirectory = "/home/andrew";

    # Imports
    imports = [
      ../../default.nix
    ];

    # === === === === === === === === === === === === === === === === === === === === #
    #
    # ░█▀█░█▀█░█▀▀░█░█░█▀█░█▀▀░█▀▀░█▀▀
    # ░█▀▀░█▀█░█░░░█▀▄░█▀█░█░█░█▀▀░▀▀█
    # ░▀░░░▀░▀░▀▀▀░▀░▀░▀░▀░▀▀▀░▀▀▀░▀▀▀
    #
    # Desktop Environment Packages
    # ------------------------------------------------------------------------------- #

    packages = with pkgs; [
      hyprland                           # Dynamic Tiling Window Compositor (daemon, bins, lib)
      hyprpaper                          # Hyprland Wallpaper Manager (daemon, bin/hyprpaper)
      waybar                             # Status Bar for Wayland (lib, bin/waybar)
      wofi                               # Application Launcher (bin/wofi)
      alacritty                          # GPU-Accelerated Terminal Emulator (bin/alacritty)
    ];

    # === === === === === === === === === === === === === === === === === === === === #
    #
    # ░█▀▀░█▀█░█░█░█▀▄░█▀▀░█▀▀░█▀▀
    # ░▀▀█░█░█░█░█░█▀▄░█░░░█▀▀░▀▀█
    # ░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀
    #
    # Dotfile Paths
    # ------------------------------------------------------------------------------- #

    home.file = {
      # hyprland sources

      # hyprpaper sources

      # waybar sources

      # wofi sources

      # alacritty sources
    };

    # === === === === === === === === === === === === === === === === === === === === #
  };
}
