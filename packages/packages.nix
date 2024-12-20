{ config, pkgs, inputs, ... }:
{



    nixpkgs.config.permittedInsecurePackages = [
        "freeimage-unstable-2021-11-01"
    ];

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        # Install Nix Flakes as packages
        # inputs.nixvim-flake.packages."${pkgs.system}".nixvim
        # inputs.nixvim-flake
        
        (import ./nix-quartus/web13.nix)

        # Desktop Programs
        parsec-bin
        google-chrome
        obsidian
        slack
        teams-for-linux
        discord
        saleae-logic-2
        spotify
        libreoffice
        
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
        openmpi
        mpich
        eigen
        # ROS Dev Tools (MUST ADD TO ROS OVERLAY)
        colcon # Required to be here
        rosPackages.humble.ros-core
        rosPackages.humble.ament-cmake-core
        rosPackages.humble.geometry-msgs

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
        llvmPackages.libclang
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
        nil # nix LSP
        ];
}
