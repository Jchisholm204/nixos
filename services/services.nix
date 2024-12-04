{ config, pkgs, inputs, ... }:
{
    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

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

}

