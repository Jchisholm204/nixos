{ config, pkgs, inputs, ... }:

{
    imports = [ # Include the results of the hardware scan.
            ./hardware-configuration.nix
            inputs.nix-ros-overlay.nixosModules.default
        ];

    nixpkgs.overlays = [ inputs.nix-ros-overlay.overlays.default ];
    
    services.ros2 = {
        enable = true;
        distro = "humble";
        systemPackages = p: [ pkgs.rosPackages.humble.ros-core ];
    };


    networking.hostName = "taurine"; # Define your hostname.

    # Set your time zone.
    time.timeZone = "America/Toronto";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_CA.UTF-8";

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.jacob = {
        isNormalUser = true;
        description = "Jacob Chisholm";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [ ];
        shell = pkgs.zsh;
    };

    # Enable ZSH to be used as default shell
    programs.zsh.enable = true;
    # Set the default user shell
    users.defaultUserShell = pkgs.zsh;
    # Enable and Setup TMUX (Terminal Multiplexer)
    programs.tmux = {
        enable = true;
        clock24 = true;
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # Experimental Features
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set environment variables needed for ROS 2 to work
  environment.variables = {
    AMENT_PREFIX_PATH = "${pkgs.rosPackages.humble.ros-core}/share/ament_index";
    ROS_PACKAGE_PATH = "${pkgs.rosPackages.humble.ros-core}/share";
    CMAKE_PREFIX_PATH = "${pkgs.rosPackages.humble.ros-core}/share";
  };


# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.05"; # Did you read the comment?

}
