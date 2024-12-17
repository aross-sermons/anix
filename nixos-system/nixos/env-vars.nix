# nixos/env-vars.nix

{ config, ... }:
{
  # === === === === === === === === === === === === === === === === === === === === #
  #
  # ░█▀▀░█▀█░█░█░▀█▀░█▀▄░█▀█░█▀█░█▄█░█▀▀░█▀█░▀█▀░░░█░█░█▀█░█▀▄░█▀▀
  # ░█▀▀░█░█░▀▄▀░░█░░█▀▄░█░█░█░█░█░█░█▀▀░█░█░░█░░░░▀▄▀░█▀█░█▀▄░▀▀█
  # ░▀▀▀░▀░▀░░▀░░▀▀▀░▀░▀░▀▀▀░▀░▀░▀░▀░▀▀▀░▀░▀░░▀░░░░░▀░░▀░▀░▀░▀░▀▀▀
  #
  # Global Environment Variables
  # ------------------------------------------------------------------------------- #

  # Set Environment Variables
  environment.variables = {
    # Wayland Session Variables
    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORM = "wayland";
    GDK_BACKEND = "wayland,x11";
    CLUTTER_BACKEND = "wayland";
    SDL_VIDEODRIVER = "wayland";
    EGL_PLATFORM = "wayland";
    LIBVA_DRIVER_NAME = "iHD"; # Intel VAAPI Driver

    # Browser Variables
    MOZ_ENABLE_WAYLAND = "1";
    CHROMIUM_FLAGS = "--enable-features=WaylandWindowDecorations --ozone-platform-hint=auto";
  };
}
