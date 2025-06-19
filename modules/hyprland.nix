{pkgs,...}:
{

    programs.hyprland = {
        enable = true;
    };

    environment.systemPackages = with pkgs; [
        hyprpaper
        waybar
    ];

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