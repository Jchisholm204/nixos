{ config, pkgs, inputs, ... }:
{

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

