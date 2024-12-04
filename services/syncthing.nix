{ config, pkgs, inputs, ... }:
{

    # Enable/Setup syncthing (For my notes)
    services.syncthing = {
        enable = true;
        openDefaultPorts = true;
        user = "jacob";
        dataDir = "/home/jacob";
        configDir = "/home/jacob/.config/syncthing";
    };

}
