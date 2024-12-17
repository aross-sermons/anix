# home/users/andrew/home.nix

# The home.nix configuration file for andrew

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
    username = "andrew";
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
  };
}
