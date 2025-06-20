{pkgs,...}:{
    config = {
        programs.hyprland.enable = true;
        environment.systemPackages = [
            # ... other packages
            pkgs.kitty # required for the default Hyprland config
        ];
    };
}