{
    description = "NixOS Taurine Flake";
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
        # nixvim-flake.url = "github:pete3n/nixvim-flake/main";
        home-manager = {
            url = "github:nix-community/home-manager/release-24.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, ... }@inputs: {
        nixosConfigurations.taurine = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };
            modules = [
                ./configuration.nix

                home-manager.nixosModules.home-manager
                {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.jacob = import ./home.nix;
                }
            ];
        };
    };
}
