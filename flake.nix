{
    description = "NixOS Taurine Flake";
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
        # helix editor, use the master branch
        helix.url = "github:helix-editor/helix/master";
    };

    outputs = { self, nixpkgs, ... }@inputs: {
        nixosConfigurations.taurine = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };
            modules = [
                ./configuration.nix
            ];
        };
    };
}
