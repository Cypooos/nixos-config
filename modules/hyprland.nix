{pkgs,...}:
{
    programs.kitty.enable = true; # required for the default Hyprland config
    wayland.windowManager.hyprland = {
        enable = true;
        package = pkgs.hyprland;
        systemd = {
            enable = true;
            enableXdgAutostart = true;
            variables = ["--all"];
        };
        xwayland = {
            enable = true;
        };
        extraConfig = builtins.readFile ./hyprland.conf;
    };

}