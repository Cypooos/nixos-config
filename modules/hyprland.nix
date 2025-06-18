{ ... }: { config = {
    
    wayland.windowManager.hyprland = {
        enable = true;

        plugins = [
            inputs.hyprland-plugins.packages."${pkgs.system}".borders-plus-plus
        ];

        settings = {

            decoration = {
                rounding=8;
                blur=0;
                drop_shadow=0;
                shadow_range=60;
                "col.shadow"="0x66000000";
            };

            general = {
                sensitivity=1;
                main_mod=ALT;

                gaps_in=6;
                gaps_out=12;
                border_size=4;
                "col.active_border"="0xffb072d1";
                "col.inactive_border"="0xff292a37";

                damage_tracking=full;
            };

            animations = {
                enabled = true;
                first_launch_animation = true;
                workspace_wraparound = true;
            };

            "$mod" = "SUPER";

            bindm = [
                # mouse movements
                "$mod, mouse:272, movewindow"
                "$mod, mouse:273, resizewindow"
                "$mod ALT, mouse:272, resizewindow"
                "$mod,1,workspace,1"
                "$mod,2,workspace,2"
                "$mod,3,workspace,3"
                "$mod,4,workspace,4"
                "$mod,5,workspace,5"
                
                "$mod,Return,exec,bash"
                "$mod,f,exec,firefox"
                "$mod,q,killactive,"
                "$mod,F11,fullscreen,0"

                "$mod,h,movefocus,l"
                "$mod,l,movefocus,r"
                "$mod,k,movefocus,u"
                "$mod,j,movefocus,d"
            ];
        };
    };};
}