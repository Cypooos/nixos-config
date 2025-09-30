{pkgs,nixpkgs,...}:{

    imports = [
        ./steam.nix
        ./vscode.nix
    ];

    config = {
        nixpkgs.config.allowUnfree = true;

        # fonts
        fonts = {
            fontDir.enable = true;
            packages = with pkgs; [
            corefonts
            inconsolata
            terminus_font
            dejavu_fonts
            ubuntu_font_family
            source-code-pro
            source-sans-pro
            source-serif-pro
            roboto-mono
            roboto
            overpass
            libre-baskerville
            font-awesome
            nerd-fonts.iosevka
            julia-mono
            ];
        };

        programs.firefox.enable = true;

        # List packages installed in system profile. To search, run:
        # $ nix search wget
        environment.systemPackages = with pkgs; [
            sops
            hyfetch
            git
            wget
            cargo
            gcc
            discord
            gnumake
            nano
            python3
            python311Packages.numpy
            alejandra
            libnotify
            neofetch
            htop
            flex
            docker
            gg
            vlc
            cachix
            vscode
            typst
            font-awesome
            obs-studio
            discord-ptb
            bluez
            bluez-tools
            prismlauncher
            # creative software
            gimp3-with-plugins
            lmms
            # VR
            alvr
            vaapi-intel-hybrid
            intel-vaapi-driver
            intel-media-driver
            # 3D
            orca-slicer
            # minecraft
            # anki-bin
            vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
            #  wget
        ];

    };
}