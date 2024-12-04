{ config, pkgs, inputs, ... }:

{
    imports = [ # Include the results of the hardware scan.
            ./hardware-configuration.nix
            ./users.nix
        ];

    nixpkgs.overlays = [ inputs.nix-ros-overlay.overlays.default ];
    

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Enable networking
    networking.networkmanager.enable = true;

    networking.hostName = "taurine"; # Define your hostname.

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # Experimental Features
    nix.settings.experimental-features = [ "nix-command" "flakes" ];



# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.05"; # Did you read the comment?

}