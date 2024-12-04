{
    description = "NixOS Taurine Flake";
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
        # nixvim-flake.url = "github:pete3n/nixvim-flake/main";
        nix-ros-overlay.url = "github:lopsided98/nix-ros-overlay";
        nixpkgs.follows = "nix-ros-overlay/nixpkgs";  # IMPORTANT!!!
    };

    outputs = { self, nixpkgs, ... }@inputs: {
        nixosConfigurations.taurine = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };
            modules = [
                ./config/configuration.nix
                ./packages.nix
            ];
        };
    };
}
