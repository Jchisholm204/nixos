{ config, pkgs, inputs, ... }:

{
    imports = [
        ./ros.nix
    ];
    nixpkgs.overlays = [ inputs.nix-ros-overlay.overlays.default ];

}
