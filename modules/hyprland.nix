{pkgs,...}:
{

    #programs.hyprland = {
    #    # Install the packages from nixpkgs
    #    enable = true;
    #    # Whether to enable XWayland
    #    xwayland.enable = true;
    # 
    #    # Optional
    #    # Whether to enable patching wlroots for better Nvidia support
    #    #enableNvidiaPatches = true;
    #};

    services.greetd = {
        enable = true;
        settings = rec {
        initial_session = {
            command = "${pkgs.hyprland}/bin/hyprland";
            user = "coda";
        };
        default_session = initial_session;
        };
    };

}