{
    description = "NixOS Taurine Flake";
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
        # nixvim-flake.url = "github:pete3n/nixvim-flake/main";
        nix-ros-overlay.url = "github:lopsided98/nix-ros-overlay";
    };

    outputs = { self, nixpkgs, ... }@inputs: {
        nixosConfigurations.taurine = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };
            modules = [
                ./configuration.nix
                {
                    nixpkgs.overlays = [ nix-ros-overlay.overlays.default ];
                    environment.systemPackages = with pkgs; [
                        colcon  # ROS build tool
                        rosPackages.humble.ros-core  # Base ROS 2 Humble installation
                        # Add more ROS 2 Humble packages as needed
                    ];
                }
            ];
        };
    };
}
