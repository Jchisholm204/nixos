# Users and User configuration
{ config, pkgs, inputs, ... }:
{

    # Set your time zone.
    time.timeZone = "America/Toronto";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_CA.UTF-8";

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.jacob = {
        isNormalUser = true;
        description = "Jacob Chisholm";
        # This is me.. I want to have sudo privs
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

}
