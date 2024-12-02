{ config, pkgs, ... }:
{
# Bootloader.
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;

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
services.xserver.libinput.enable = true;
# Enable the fingerprint sensor
services.fprintd.enable = true;
# Framwork Bios Updates
services.fwupd.enable = true;
# Enable the OpenSSH daemon.
services.openssh.enable = true;

# Syncthing
services.syncthing = {
    enable = true;
    openDefaultPorts = true;
};

}
