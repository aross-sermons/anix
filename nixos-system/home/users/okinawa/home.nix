# home/users/okinawa/home.nix

# The home.nix configuration file for okinawa

{ config, pkgs, ... }:
{
  # Imports
  imports = [
    (import ../../default.nix)
  ];

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
    homeDirectory = "/home/okinawa";

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


    # Session Variables
    sessionVariables = {
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";

      XDG_RUNTIME_DIR = "/run/user/$UID";

      WAYLAND_DISPLAY = "wayland-1";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";

      GDK_BACKEND = "wayland,x11";
      SDL_VIDEODRIVER = "wayland";
      CLUTTER_BACKEND = "wayland";

      GDK_SCALE = "1";

      MOZ_ENABLE_WAYLAND = "1";
      MOZ_WEBRENDER = "1";
    };

    # === === === === === === === === === === === === === === === === === === === === #
    #
    # ░█▀▀░█▀█░█░█░█▀▄░█▀▀░█▀▀░█▀▀
    # ░▀▀█░█░█░█░█░█▀▄░█░░░█▀▀░▀▀█
    # ░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀
    #
    # Dotfile Paths
    # ------------------------------------------------------------------------------- #

    file = {
      # hyprland sources
      ".config/hypr" = {
        source = ./dotfiles/hypr;
        recursive = true;
      };

      # waybar sources
      ".config/waybar" = {
        source = ./dotfiles/waybar;
        recursive = true;
      };
    };

    # === === === === === === === === === === === === === === === === === === === === #
  };
}
