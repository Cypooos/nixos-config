{pkgs,...}:{
    config = {

        # Allow unfree packages
        nixpkgs.config.allowUnfree = true;
        # Allow flakes
        nix.settings.experimental-features = ["nix-command" "flakes"];

        # Bootloader.
        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;

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