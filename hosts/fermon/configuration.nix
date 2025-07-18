{ config, lib, pkgs, gui, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./../../modules/vscode.nix
    ] ++ (if (gui == "hyprland") then
      [./../../modules/hyprland.nix]
    else
      [./../../modules/plasma.nix]
    );
  
  sops.age.keyFile = "/etc/sops/age/keys.txt";
  sops.defaultSopsFile = ./../../secrets.enc.yaml;
  systemd.tmpfiles.rules = [
    "d /home/cypooos/.ssh 0700 cypooos cypooos"
  ];
  sops.secrets.ssh_github = {
    mode = "0400";
    owner = "cypooos";
    path = "/home/cypooos/.ssh/github";
  };
  sops.secrets.ssh_github_pub = {
    mode = "0400";
    owner = "cypooos";
    path = "/home/cypooos/.ssh/github.pub";
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  networking.hostName = "fermon"; 
  system.nixos.label = gui + "-test";

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Enable networking
  networking.networkmanager.enable = true;

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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb.layout = "fr";
  services.xserver.xkb.options = "eurosign:e,caps:escape";


  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cypooos = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };
  

  programs.ssh.startAgent = true;
  # programs.ssh.knownHosts = {
  #   "github/ed25519" = {
  #     publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl";
  #     hostNames = [ "github.com" ];
  #   };
  #   "github/sha2" = {
  #     publicKey = "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg=";
  #     hostNames = [ "github.com" ];
  #   };
  #   "github/rsa" = {
  #     publicKey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCj7ndNxQowgcQnjshcLrqPEiiphnt+VTTvDP6mHBL9j1aNUkY4Ue1gvwnGLVlOhGeYrnZaMgRK6+PKCUXaDbC7qtbW8gIkhL7aGCsOr/C56SJMy/BCZfxd1nWzAOxSDPgVsmerOBYfNqltV9/hWCqBywINIR+5dIg6JTJ72pcEpEjcYgXkE2YEFXV1JHnsKgbLWNlhScqb2UmyRkQyytRLtL+38TGxkxCflmO+5Z8CSSNY7GidjMIZ7Q4zMjA2n1nGrlTDkzwDCsw+wqFPGQA179cnfGWOWRVruj16z6XyvxvjJwbz0wQZ75XK5tKSb7FNyeIEs4TT4jk+S4dhPeAUC5y+bDYirYgM4GC7uEnztnZyaVWQ7B381AK4Qdrwt51ZqExKbQpTUNn+EjqoTwvqNj4kqx5QUCI0ThS/YkOxJCXmPUWZbhjpCg56i+2aB6CmK2JGhn57K5mj0MNdBXA4/WnwH6XoPWJzK5Nyu2zB3nAZp+S5hpQs+p1vN1/wsjk=";
  #     hostNames = [ "github.com" ];
  #   };
  # };

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

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

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
    # minecraft
    # anki-bin
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
  ];
  programs.steam.enable = true;

  environment.variables.EDITOR = "code --wait";

  system.stateVersion = "25.11"; # Do not change

}

