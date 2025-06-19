{pkgs,...}:
{

    programs.hyprland = {
        enable = true;
        withUWSM = true;
    };

    # security.pam.services.hyprlock = {};

    environment.systemPackages = with pkgs; [
        hyprpaper
        waybar
    ];

}