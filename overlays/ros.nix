{ config, pkgs, inputs, ... }:
{
    # Import the ROS overlay
    imports = [
        inputs.nix-ros-overlay.nixosModules.default
    ];

    # Enable the ROS2 Service
    services.ros2 = {
        enable = true;
        distro = "humble";
        systemPackages = p: [
            # List packages here that need to be installed with ROS
            # ROS packages take the form pkgs.rosPackages.<distro>.<pkg-name>
            # See lopsided98/nix-ros-overlay/distros/humble
            # Every subfolder inside of the distro folder is a package name
            pkgs.rosPackages.humble.ros-core
        ];
    };

    # Set environment variables needed for ROS 2 to work
    environment.variables = {
        AMENT_PREFIX_PATH = "${pkgs.rosPackages.humble.ros-core}/share/ament_index";
        ROS_PACKAGE_PATH = "${pkgs.rosPackages.humble.ros-core}/share";
        CMAKE_PREFIX_PATH = "${pkgs.rosPackages.humble.ros-core}/share";
    };
}
