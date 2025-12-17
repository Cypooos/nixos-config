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
            thunderbird
            davinci-resolve
            tor-browser
            emacs
            (pkgs.ffmpeg-full.override { 
                withUnfree = false; # Allow unfree dependencies (for Nvidia features notably)
                withMetal = false; # Use Metal API on Mac. Unfree and requires manual downloading of files
                withMfx = false; # Hardware acceleration via the deprecated intel-media-sdk/libmfx. Use oneVPL instead (enabled by default) from Intel's oneAPI.
                withTensorflow = false; # Tensorflow dnn backend support (Increases closure size by ~390 MiB)
                withSmallBuild = false; # Prefer binary size to performance.
                withDebug = false; # Build using debug options
            })
        ];

    };
}