{pkgs,...}:
{
    config = {
        programs.hyprland.enable = true; 
        
        wayland.windowManager.hyprland = {
            enable = true;
            settings = {
                animations.enabled = "yes";
            };
        };
    };
}