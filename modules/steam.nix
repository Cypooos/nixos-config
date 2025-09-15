{pkgs,...}:{
    config = {
        programs.steam = {
            enable = true;
            remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
            dedicatedServer.openFirewall = true; # Open ports in the firewall for Source
        };

        programs.alvr = {enable = true; openFirewall = true;};
    };
}