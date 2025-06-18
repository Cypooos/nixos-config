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

        settings = {


            decoration = {
                rounding = 10;
                blur = {
                enabled = true;
                size = 5;
                passes = 3;
                ignore_opacity = false;
                new_optimizations = true;
                };
                shadow = {
                enabled = true;
                range = 4;
                render_power = 3;
                color = "rgba(1a1a1aee)";
                };
            };

            animations.enabled = "yes";

            "$mod" = "SUPER";

            bindm = [
                "$mod, Return, exec, kitty"
                "$mod, Q, killactive,"
                "$mod, F, exec, firefox"

                "$mod, h, movefocus, l"
                "$mod, l, movefocus, r"
                "$mod, k, movefocus, u"
                "$mod, j, movefocus, d"


                "$mod CTRL, l, resizeactive, 10 0"
                "$mod CTRL, h, resizeactive, -10 0"
                "$mod CTRL, k, resizeactive, 0 -10"
                "$mod CTRL, j, resizeactive, 0 10"


                "$mod SHIFT, l, movewindow, r"
                "$mod SHIFT, h, movewindow, l"
                "$mod SHIFT, k, movewindow, u"
                "$mod SHIFT, j, movewindow, d"

                "$mod, mouse:272, movewindow"
                "$mod, mouse:273, resizewindow"
            ]
        };
    };
}