{pkgs,...}:
{
    wayland.windowManager.hyprland = {
        enable = true;
        settings = {
            animations.enabled = "yes";
        };
    };
}