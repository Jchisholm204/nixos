{ config, pkgs, inputs, ... }:

{
    imports =
        [ # Include the results of the hardware scan.
            ./hardware-configuration.nix
            inputs.nix-ros-overlay.nixosModules.default
        ];

    services.ros2 = {
        enable = true;
        distro = "humble";
    };

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "taurine"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "America/Toronto";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_CA.UTF-8";

    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

# Enable the Hypr Desktop Environment.
# programs.hyprland.enable = true;

    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound with pipewire.
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };

# Enable touchpad support (enabled default in most desktopManager).
# services.xserver.libinput.enable = true;

# Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.jacob = {
        isNormalUser = true;
        description = "Jacob Chisholm";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [ ];
        shell = pkgs.zsh;
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # Enable ZSH to be used as default shell
    programs.zsh.enable = true;
    # Set the default user shell
    users.defaultUserShell = pkgs.zsh;

# Experimental Features
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # nixpkgs.overlays = [ inputs.nix-ros-overlay.overlays.default ];

nixpkgs.config.permittedInsecurePackages = [
    "freeimage-unstable-2021-11-01"
];

# List packages installed in system profile. To search, run:
# $ nix search wget
    environment.systemPackages = with pkgs; [
        # Install Nix Flakes as packages
        # inputs.nixvim-flake.packages."${pkgs.system}".nixvim
        # inputs.nixvim-flake

        # Desktop Programs
        parsec-bin
        google-chrome
        obsidian
        slack
        teams-for-linux

        # System Tools
        wget
        htop
        unzip
        nix-ld
        syncthing
        usbutils

        # Dev Tools
        vscode
        git
        gh
        neovim
        tmux
        gnumake
        cmake
        gcc
        gcc-arm-embedded
        libgcc
        libstdcxx5
        glibc
        glibc_multi
        # ROS Dev Tools
        colcon
        rosPackages.humble.ros-core
        rosPackages.humble.ament-package
        rosPackages.humble.ros2cli
        rosPackages.humble.rclcpp
        rosPackages.humble.rclpy
        rosPackages.humble.rosbag2
        rosPackages.humble.diagnostics
        rosPackages.humble.common-interfaces
        rosPackages.humble.sensor-msgs
        # rosPackages.humble.navigation2
        rosPackages.humble.robot-state-publisher
        rosPackages.humble.tf2
        rosPackages.humble.rviz2
        # rosPackages.humble.gazebo-ros-pkgs
        # rosPackages.humble.ros-core
        # rosPackages.humble.ros2cli
        # rosPackages.humble.rosbag2
        # rosPackages.humble.as2-cli
        # rosPackages.humble.as2-core
        # rosPackages.humble.ament-package
        # rosPackages.humble.rclcpp
        # rosPackages.humble.rclpy
        # rosPackages.humble.common-interfaces
        # rosPackages.humble
        # inputs.nix-ros-overlay.legacyPackages."${pkgs.system}".humble.ros-core
        # inputs.nix-ros-overlay.legacyPackages."${pkgs.system}".colcon
        # inputs.nix-ros-overlay.legacyPackages."${pkgs.system}".colcon
        # rosPackages.humble.ros-core
        # rosPackages.humble.ros-perception

        # Terminal Applications
        alacritty
        fastfetch
        zsh
        zsh-autosuggestions
        starship

        # System Services
        fprintd # Fingerprint Reader
        python3
        nodejs_22
        rustup
        openssl
        openssl_3_3
        pkg-config

        # language servers, libs, etc.
        lua-language-server
        libclang
        clang-tools
        clang
        ccls
        rust-analyzer
        python3
        nodejs_22
        rustup
        openssl
        openssl_3_3
        pkg-config
        # nil # nix LSP
        ];


    # Enable and Setup TMUX (Terminal Multiplexer)
    programs.tmux = {
        enable = true;
        clock24 = true;
    };

    # Fingerprint Service (For Framework)
    services.fprintd.enable = true;
    # Framework BIOS Update
    services.fwupd.enable = true;

    # Enable the OpenSSH daemon.
    services.openssh.enable = true;

    # Enable/Setup syncthing (For my notes)
    services.syncthing = {
        enable = true;
        openDefaultPorts = true;
        user = "jacob";
        dataDir = "/home/jacob";
        configDir = "/home/jacob/.config/syncthing";
    };

# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.05"; # Did you read the comment?

}
