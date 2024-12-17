# nixos/packages.nix

# Full package list for nixos/system packages

{ pkgs, ... }:

{
  environment.systemPackages = [
    # === === === === === === === === === === === === === === === === === === === === #
    #
    # ░█░█░█▀█░█▀▄░█▀▄░█░█░█▀█░█▀▄░█▀▀░░░█▀▀░█▀▀░█▀▀░█▀▀░█▀█░▀█▀░▀█▀░█▀█░█░░░█▀▀
    # ░█▀█░█▀█░█▀▄░█░█░█▄█░█▀█░█▀▄░█▀▀░░░█▀▀░▀▀█░▀▀█░█▀▀░█░█░░█░░░█░░█▀█░█░░░▀▀█
    # ░▀░▀░▀░▀░▀░▀░▀▀░░▀░▀░▀░▀░▀░▀░▀▀▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░░▀░░▀▀▀░▀░▀░▀▀▀░▀▀▀
    #
    # Firmware, Drivers, and Libraries for Hardware Components
    # ------------------------------------------------------------------------------- #

    # Linux Firmware
    linux-firmware                       # Binary Firmware (packages)
    fwupd                                # Firmware Updater (daemon, bin)
      # (bin/dbxtool, bin/fwupdmgr, bin/fwupdtool)
    fwupd-efi                            # EFI Firmware Updater (EFI bin)

    # Intel CPU Microcode
    microcodeIntel                       # Microcode for Intel Processors
    iucode-tool                          # Intel Microcode Tool (bin/iucode_tool)
    inteltool                            # Information on Intel CPU (bin/inteltool)

    # File Systems
    e2fsprogs                            # extN Filesystem Tools (bins)
    xfsprogs                             # xfs Filesystem Tools

    # Audio Server
    pipewire                             # Audio Server (daemon, bins)
    alsa-utils                           # ALSA CLI Tools (bins)
    bluez                                # Bluetooth Stack (daemon)
    bluez-tools                          # Bluetooth Management Tools (bins)
      # (bin/bt-adapter, bin/bt-agent, bin/bt-device, bin/bt-network, bin/bt-obex)

    # Rendering Packages
    mesa                                 # 3D Graphics Library (libs, bins)
    mesa-demos                           # Mesa/OpenGL Test Programs (bins)
    vulkan-loader                        # Vulkan API Loader (libs)
    vulkan-tools                         # Vulkan Debug Tools (bins)
    vulkan-validation-layers             # Vulkan Validation Tools (libs, bins)
    libGL                                # OpenGL Runtime Library (libs)
    libGLU                               # High Level OpenGL Library (libs)
    libva                                # VA-API Video Acceleration (libs)
    xorg.xf86videointel                  # X11 Intel GPU Driver (driver)

    # Screen Color and Brightness
    brightnessctl                        # Adjust Screen Brightness (bin/brightnessctl)
    redshift                             # Screen Temperature Manager (daemon, bins)
      # (bin/redshift, bin/redshift-gtk)

    # Performance Tuning
    tlp                                  # Advanced Power Management (daemon, bins)
    auto-cpufreq                         # Light, Automatic TLP Alternative (daemon, bins)
      # Choose to enable either tlp or auto-cpufreq
    thermald                             # CPU Temperature Manager (daemon)
    upower                               # Power Information Daemon (daemon, libs)

    # Network Management
    networkmanager                       # Primary Connection Manager (daemon, bins)
      # (bin/NetworkManager, bin/nm-online, bin/nmcli)
    wpa_supplicant                       # Wi-Fi Authentication Deamon (daemon, bins)
      # (bin/wpa_cli, bin/wpa_passphrase, bin/wpa_supplicant)
    openvpn                              # VPN Client (bin/openvpn)

    # Other Device Hardware Packages
    acpid                                # ACPI Event Listener (daemon)
    lm_sensors                           # Monitors System Hardware (bins)
      # (bin/fancontrol, bin/isadump, bin/isaset, bin/pwnconfig,
      # bin/sensors, bin/sensors-conf-convert, bin/sensors-detect)
    nvme-cli                             # NVME Monitoring and Management Tools (bin/nvme)
    xorg.xf86inputlibinput               # Modern Input Driver (driver)
    xorg.xf86inputsynaptics              # Legacy Synaptics Touchpad Driver (driver)
      # May work better for Dell XPS 13
    xinput                               # Input Device Debugging Tool (bin/xinput)

    # === === === === === === === === === === === === === === === === === === === === #
    #
    # ░█▀▀░█░█░█▀▀░▀█▀░█▀▀░█▄█░░░▀█▀░█▀█░█▀█░█░░░█▀▀
    # ░▀▀█░░█░░▀▀█░░█░░█▀▀░█░█░░░░█░░█░█░█░█░█░░░▀▀█
    # ░▀▀▀░░▀░░▀▀▀░░▀░░▀▀▀░▀░▀░░░░▀░░▀▀▀░▀▀▀░▀▀▀░▀▀▀
    #
    # Extensive List of CLI Tools
    # ------------------------------------------------------------------------------- #

    # Utility Bundles
    util-linux                           # System Utilities (bins)

    # System Monitoring
    htop                                 # Interactive Process Viewer (bin/htop)
    iotop                                # I/O Process Usage Monitor (bin/iotop)
    glances                              # System Monitoring (bin/glances)
    dstat                                # Resource Statistics Tool (bin/dstat)
    powertop                             # Analyze Power Consumption (bin/powertop)
    iftop                                # Display Bandwidth Usage (bin/iftop)

    # Utilities
    man                                  # Unix Documentation System (bin/man)
    man-pages                            # Linux Development Pages (lib)
    tldr                                 # Simplified man Pages (bin/tldr)
    bc                                   # Calculator (bin/bc, bin/dc)

    # Network Tools
    nmap                                 # Network and Security Auditing (bin/nmap)
    iproute2                             # Advanced Networking Tools (bins)
    pingu                                # Modern Ping Command (bin/pingu)
    traceroute                           # Traces Packet Routes (bin/traceroute)
    netcat                               # Network Diagnostic Tool (bin/netcat)
    mtr                                  # Combines ping and traceroute (bin/mtr)
    speedtest-cli                        # Internet Bandwidth Test (bin/speedtest-cli)
    wget                                 # Non-interactibe Downloader (bin/wget)
    curl                                 # Data Transfer Tool (bin/curl)

    # File Management
    fd                                   # Fast find Alternative (bin/fd)
    exa                                  # Modern ls Replacement (bin/exa)
    duf                                  # Disk Usage Viewer (bin/duf)
    zip                                  # Zip File Creator (bins)
      # (bin/zipsplit, bin/zip, bin/zipcloak, bin/zipnote)
    unzip                                # Zip File Extractor (bins)
      # (bin/unzip, bin/funzip, bin/zipinfo, bin/zipgrep, bin/unzipsfx)
    p7zip                                # 7Zip Manager (bins)
      # (bin/7z, bin/7zr, bin/7za)
    file                                 # File Type Descriptor (bin/file)
    diffutils                            # Shows Differences Between Files (bins)
      # (bin/diff, bin/diff3, bin/sdiff, bin/cmp)
    lsof                                 # List Open Files (bin/lsof)

    # Text Processing
    nano                                 # Simple Text Editor (bin/nano)
    neovim                               # Feature-Rich Text Editor (bin/nvim)
    bat                                  # Enhanced cat (bin/bat)
    awk                                  # Pattern Processing Language (bin/awk)
    fzf                                  # Fuzzy Search (bin/fzf)
    ripgrep                              # Fast grep Alternative (bin/rg)
    jp                                   # JSON Processor (bin/jq)
    yq                                   # YAML Processor (bin/yq)

    # Development Tools
    git                                  # Version Control System (bin/git)
    cmake                                # Build System Generator (bin/cmake)

    # Security and Encryption
    openssl                              # SSL/TLS Cryptography Tool (bin/openssl)
    gnupg                                # GNU Privacy Guard

    # Shells
    bash                                 # Bourne Again Shell (bin/bash)
    zsh                                  # Z-Shell (bin/zsh)

    # === === === === === === === === === === === === === === === === === === === === #
    #
    # ░█▀▄░█▀▀░█▀▀░█░█░▀█▀░█▀█░█▀█░░░█▀▀░█▀█░█░█░▀█▀░█▀▄░█▀█░█▀█░█▄█░█▀▀░█▀█░▀█▀
    # ░█░█░█▀▀░▀▀█░█▀▄░░█░░█░█░█▀▀░░░█▀▀░█░█░▀▄▀░░█░░█▀▄░█░█░█░█░█░█░█▀▀░█░█░░█░
    # ░▀▀░░▀▀▀░▀▀▀░▀░▀░░▀░░▀▀▀░▀░░░░░▀▀▀░▀░▀░░▀░░▀▀▀░▀░▀░▀▀▀░▀░▀░▀░▀░▀▀▀░▀░▀░░▀░
    #
    # Global Wayland Server, X Compatibility, and Desktop Tools
    # ------------------------------------------------------------------------------- #

    # Wayland Server
    wayland                              # Core Wayland Protocols (libs)
    wayland-protocols                    # Additional Wayland Protocols (libs)
    wlroots                              # Backend Compositor Support (lib)
    wlr-protocols                        # Wlroots Protocol Extensions (libs)
    wlr-randr                            # Xrandr Clone (bin/wlr-randr)
    wayland-utils                        # Wayland Utilities (bin/wayland-info)
    wev                                  # Wayland Event Viewer (bin/wev)
    wl-clipboard                         # Wayland Clipboard (bin/wl-copy, bin/wl-paste)
    wl-clipboard-x11                     # Wayland-X11 Clipboard Wrapper (bins)

    # X11 Compatibility
    xwayland                             # X11 Server (daemon)
    (with xorg; [
      xrandr                             # Live X Server Reconfiguration (bin/xrandr)
      xset                               # Set Display Preferences (bin/xset)
      libX11                             # X11 Client-Side Library (lib)
      libxcb                             # Modern libX11 Replacement (lib)
      libXcursor                         # X11 Cursor Management (lib)
      libXinerama                        # Multi-Monitor Support (lib)
      libXrandr                          # Screen Resolution Handling (lib)
      libXcomposite                      # X11 Compositing (lib)
      libXdamage                         # Tracks Damaged X11 Window Areas (lib)
      libXtst                            # X11 Test Extensions (lib)
      libXi                              # X11 Input Extensions (lib)
      xsetroot                           # Sets Root Window Properties (bin/xsetroot)
      xprop                              # Displays Window Properties (bin/xprop)
      xev                                # X11 Event Viewer (bin/xev)
      xkill                              # Kills X11 Apps (bin/xkill)
    ])

    # XDG Features
    xdg-utils                            # XDG CLI Tools (bins)
    xdg-desktop-portal                   # Sandboxed App Portal (daemon)
    xdg-desktop-portal-wlr               # Portal for Wlroots Compositors (daemon)
    xdg-user-dirs                        # Default Directory Manager (daemon)

    # Greeter
    greetd.greetd                        # Greetd Greeter (daemon, bins)
      # (bin/agreety, bin/fakegreet, bin/greetd)
    greetd.regreet                       # Clean Greeter (bin/regreet)

    # Default Desktop
    hyprland                             # Dynamic Tiling Window Compositor (daemon, bins, lib)
    foot                                 # Wayland-native Terminal Emulator

    # === === === === === === === === === === === === === === === === === === === === #
    #
    # ░█▀▄░█▀▀░█░█░░░█▀▀░█▀█░█░█░▀█▀░█▀▄░█▀█░█▀█░█▄█░█▀▀░█▀█░▀█▀
    # ░█░█░█▀▀░▀▄▀░░░█▀▀░█░█░▀▄▀░░█░░█▀▄░█░█░█░█░█░█░█▀▀░█░█░░█░
    # ░▀▀░░▀▀▀░░▀░░░░▀▀▀░▀░▀░░▀░░▀▀▀░▀░▀░▀▀▀░▀░▀░▀░▀░▀▀▀░▀░▀░░▀░
    #
    # Packages and Libraries for Development
    # ------------------------------------------------------------------------------- #

    # Python
    python312                              # Python 3.12 (bins)
      # (bin/python3.12, bin/pydoc3.12, bin/idle3.12, bin/2to3-3.12)
    python312Packages.pip                  # Package Manager (bin/pip)
    python312Packages.virtualenv           # Virtual Environment Manager (bin/virtualenv)
    pylint                                 # Linter (bins)
      # (bin/pylint, bin/pylint-config, bin/pyreverse, bin/symilar)

    # Rust
    rustup                                 # Rust Toolchain Manager (bin/rustup)
    cargo                                  # Package Manager (bin/cargo)
    rustc                                  # Compiler (bin/rustc, bin/rustdoc)
    clippy                                 # Linter (bin/cargo-clippy, bin/clippy-driver)

    # Java
    openjdk17-bootstrap                    # OpenJDK 17 (bins, bin/jar, bin/java, bin/javac)

    # JavaScript
    nodejs_20                              # LTS JavaScript Runtime (bin/node)
    nodePackages.npm                       # Package Manager (bin/npm)
    eslint                                 # Linter (bin/eslint)

    # SQL
    mysql84                                # MySQL Server
    dbeaver-bin                            # Database GUI (bin/dbeaver)

    # === === === === === === === === === === === === === === === === === === === === #
    #
    # ░█▀█░█▀█░█▀█░█░░░▀█▀░█▀▀░█▀█░▀█▀░▀█▀░█▀█░█▀█░█▀▀
    # ░█▀█░█▀▀░█▀▀░█░░░░█░░█░░░█▀█░░█░░░█░░█░█░█░█░▀▀█
    # ░▀░▀░▀░░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀░▀░░▀░░▀▀▀░▀▀▀░▀░▀░▀▀▀
    #
    # Application Packages for Productivity and Development
    # ------------------------------------------------------------------------------- #

    # Browsers
    firefox                                # Firefox Web Browser
    tor-browser                             # Anonymous Browser (bin/tor-browser)
    chromium                               # Open Source Google Browser
    logseq                                 # Markdown Note Manager
    spotify                                # Spotify
    libreoffice                            # Office Suite
    kdePackages.okular                     # Document Viewer
    whatsapp-for-linux                     # Whatsapp Messenger
    discord                                # Discord
    bitwarden-desktop                      # Password Manager
    bitwarden-cli                          # Password Manager
    gimp                                   # GIMP Image Editor
    viewnoir                               # Light Image Viewer
    vlc                                    # Media Player
    umlet                                  # UML Diagram Designer
  ];
}
