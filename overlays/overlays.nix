{ config, pkgs, inputs, ... }:

{
    # Import other overlays
    imports = [
        ./ros.nix
    ];

    # Add overlays to nixpkgs
    nixpkgs.overlays = [
        inputs.nix-ros-overlay.overlays.default
    ];

}
