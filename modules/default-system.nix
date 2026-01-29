{pkgs,...}:{
    config = {

        # Allow unfree packages
        nixpkgs.config.allowUnfree = true;
        # Allow flakes
        nix.settings.experimental-features = ["nix-command" "flakes"];

        # Bootloader.
        boot = {
            loader.systemd-boot.enable = true;
            loader.efi.canTouchEfiVariables = true;
            
            consoleLogLevel = 3;
            initrd.systemd.enable = true;
            initrd.verbose = false;
            kernelParams = [
                "quiet"
                "udev.log_level=3"
                "systemd.show_status=auto"
            ];
            # Hide the OS choice for bootloaders.
            # It's still possible to open the bootloader list by pressing any key
            # It will just not appear on screen unless a key is pressed
            loader.timeout = 0;

            # plymouth, showing after LUKS unlock
            plymouth = {
                enable = true;
                theme = "colorful_sliced";
                themePackages = with pkgs; [
                    # By default we would install all themes
                    (adi1090x-plymouth-themes.override {
                    selected_themes = [ "colorful_sliced" ];
                    })
                ];
            };
        };

        

        # Define a user account. Don't forget to set a password with ‘passwd’.
        users.users.cypooos = {
            isNormalUser = true;
            extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
            packages = with pkgs; [
            tree
            ];
        };

        # Enable the X11 windowing system.
        services.xserver.enable = true;

        # Configure keymap in X11
        services.xserver.xkb.layout = "fr";
        services.xserver.xkb.options = "eurosign:e,caps:escape";

        # Set your time zone.
        time.timeZone = "Europe/Paris";

        # Select internationalisation properties.
        i18n.defaultLocale = "fr_FR.UTF-8";
        i18n.extraLocaleSettings = {
            LC_ADDRESS = "fr_FR.UTF-8";
            LC_IDENTIFICATION = "fr_FR.UTF-8";
            LC_MEASUREMENT = "fr_FR.UTF-8";
            LC_MONETARY = "fr_FR.UTF-8";
            LC_NAME = "fr_FR.UTF-8";
            LC_NUMERIC = "fr_FR.UTF-8";
            LC_PAPER = "fr_FR.UTF-8";
            LC_TELEPHONE = "fr_FR.UTF-8";
            LC_TIME = "fr_FR.UTF-8";
        };

        # Configure console keymap
        console.keyMap = "fr";

        # Allow android connection?
        services.udev.packages = [
            pkgs.android-udev-rules
        ];

        # SSH!!
        programs.ssh.startAgent = true;


        # Enable networking
        networking.networkmanager.enable = true;


        # Enable CUPS to print documents.
        services.printing.enable = true;

        # Enable bluetooth
        hardware.bluetooth.enable = true;

        # Enable sound with pipewire.
        services.pulseaudio.enable = false;
        security.rtkit.enable = true;
        services.pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
            # If you want to use JACK applications, uncomment this
            jack.enable = true;
        };
    };
}