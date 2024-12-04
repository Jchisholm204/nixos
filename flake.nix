{
    description = "NixOS Taurine Flake";
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
        # nixvim-flake.url = "github:pete3n/nixvim-flake/main";
        nix-ros-overlay.url = "github:lopsided98/nix-ros-overlay";
    };

    outputs = { self, nixpkgs, ... }@inputs: {
        nixosConfigurations.taurine = {
            nixpkgs.lib.nixosSystem = {
                system = "x86_64-linux";
                specialArgs = { inherit inputs; };
                modules = [
                    ./configuration.nix
                ];
            };
            # Use the overlay to add ROS 2 packages
            nixpkgs.overlays = [
                inputs.nix-ros-overlay.overlay
            ];
        };
    };
}
