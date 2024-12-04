{ config, pkgs, inputs, ... }:
{
    imports = [ # Include the results of the hardware scan.
        inputs.nix-ros-overlay.nixosModules.default
    ];

    nixpkgs.overlays = [ inputs.nix-ros-overlay.overlays.default ];

    services.ros2 = {
        enable = true;
        distro = "humble";
        systemPackages = p: [ pkgs.rosPackages.humble.ros-core ];
    };

    # Set environment variables needed for ROS 2 to work
    environment.variables = {
        AMENT_PREFIX_PATH = "${pkgs.rosPackages.humble.ros-core}/share/ament_index";
        ROS_PACKAGE_PATH = "${pkgs.rosPackages.humble.ros-core}/share";
        CMAKE_PREFIX_PATH = "${pkgs.rosPackages.humble.ros-core}/share";
    };
}
