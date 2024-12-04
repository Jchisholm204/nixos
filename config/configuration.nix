# Basic General Configuration for NixOS
{ config, pkgs, inputs, ... }:

{
    # Import other configuration files
    imports = [ # Include the results of the hardware scan.
            ./hardware-configuration.nix
            ./users.nix
        ];
    

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Enable networking
    networking.networkmanager.enable = true;

    # System Hostname
    # Must match the hostname used in flake.nix
    networking.hostName = "taurine";

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # Experimental Features (that have been in development for 10+ years..)
    nix.settings.experimental-features = [ "nix-command" "flakes" ];



# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    # Latest = 24.11
    system.stateVersion = "24.05"; # Did you read the comment?

}
