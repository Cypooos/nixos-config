{pkgs,...}:{
    config = {
        services.displayManager.sddm = {
            enable = true;
            package = pkgs.kdePackages.sddm;
            theme = "sddm-astronaut-theme";
            extraPackages = with pkgs; [
                kdePackages.qtmultimedia
                kdePackages.qtsvg
                kdePackages.qtvirtualkeyboard
            ];
        };

        programs.hyprland.enable = true;

        environment.systemPackages = with pkgs; [
            (pkgs.callPackage ./sddm-astronaut-theme.nix { 
                theme = "hyprland_kath";
                themeConfig={General = { HeaderText ="Howdey!";};};
            })
            kitty
            brightnessctl
            waybar
            mpvpaper
            sddm-astronaut
            rofi-wayland
            yazi
            hyprshot
        ];
    };
}