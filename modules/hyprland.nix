{ ... }: {

    wayland.windowManager.hyprland = {
        enable = true;

        plugins = [
            inputs.hyprland-plugins.packages."${pkgs.system}".borders-plus-plus
        ];

        settings = {

            decoration = {
                shadow_offset = "0 5";
            };

            "$mod" = "SUPER";

            bindm = [
                # mouse movements
                "$mod, mouse:272, movewindow"
                "$mod, mouse:273, resizewindow"
                "$mod ALT, mouse:272, resizewindow"
            ];
        };
    }
}