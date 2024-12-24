# nixos/services.nix

{ config, pkgs, ... }:
{
  # === === === === === === === === === === === === === === === === === === === === #
  #
  # ░█▀▀░█▀▀░█▀▄░█░█░▀█▀░█▀▀░█▀▀░█▀▀
  # ░▀▀█░█▀▀░█▀▄░▀▄▀░░█░░█░░░█▀▀░▀▀█
  # ░▀▀▀░▀▀▀░▀░▀░░▀░░▀▀▀░▀▀▀░▀▀▀░▀▀▀
  #
  # Service Settings
  # ------------------------------------------------------------------------------- #

  services = {
    # fwupd
    fwupd.enable = true;

    # pipewire
    pipewire = {
      enable = true;
      alsa.enable = true;
    };

    # redshift
    redshift = {
      enable = true;
      temperature.day = 5500;
      temperature.night = 8500;
    };

    # tlp
    tlp.enable = false; # Enable either tlp or auto-cpufreq, not both

    # auto-cpufreq
    auto-cpufreq.enable = true; # Enable either tlp or auto-cpufreq, not both

    # thermald
    thermald.enable = true;

    # upower
    upower = {
      enable = true;
      timeLow = 1200; # 1200 seconds = 20 minutes
      timeCritical = 600; # 600 seconds = 10 minutes
      timeAction = 120; # 120 seconds = 2 minutes
    };

    # openvpn
    openvpn.servers = { };

    # acpid
    acpid.enable = true;

    # xorg.xf86inputlibinput (libinput)
    libinput = {
      enable = true;
      touchpad = {
        dev = null; # "/path/to/device" or null for autodetect
        tapping = true; # Tap-to-click
        clickMethod = "clickfinger"; # null, "none", "buttonareas", or "clickfinger"
        scrollMethod = "twofinger"; # "none", "twofinger", "edge", or "button"
        tappingDragLock = true;
        naturalScrolling = true;
        tappingButtonMap = "lrm";
        # See docs for the many acceleration settings
        accelProfile = "adaptive";
      };
    };

    # xorg.xf86inputsynaptics (synaptics)
    # Update options before enabling
    xserver.synaptics = {
      enable = false; # Enable if touchpad bad
      dev = null; # "/path/to/device" or null for autodetect
    };

    # greetd
    greetd = {
      enable = true;
      restart = false;
      package = pkgs.greetd.regreet;
      settings = {
        default_session = {
          command = "regreet";
          user = "greeter";
        };
      };
    };
  };
}
