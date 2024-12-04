{ config, pkgs, inputs, ... }:
{
    # Import the other services
    imports = [
        ./gdm-gnome.nix
        ./syncthing.nix
    ];

    # Fingerprint Service (For Framework)
    services.fprintd.enable = true;
    # Framework BIOS Update
    services.fwupd.enable = true;

    # Enable the OpenSSH daemon.
    services.openssh.enable = true;

}

