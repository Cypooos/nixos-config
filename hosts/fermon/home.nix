{ pkgs, gui, ... }:{

  home = {
    username = "cypooos"; 
    homeDirectory = "/home/cypooos";
    sessionVariables = { EDITOR = "code --wait"; };
    stateVersion = "24.05";
  };

  home.file = {
    ".ssh/config" = {
      executable = false;
      text = ''
        Host github.com
          HostName github.com
          User git
          IdentityFile ~/.ssh/github
      '';
    };
    ".bashrc" = {
      executable = true;
      text = ''eval "$(direnv hook bash)"'';
    };
  }; 

  home.file = {
    ".config/hypr/hyprland.conf" = {
      executable = false;
      source = ./../../modules/hyprland.conf;
    };
    # from https://github.com/mubin6th/MinimalSway/blob/main/waybar/
    ".config/waybar/config" = {
      executable = false;
      source = ./../../modules/waybar;
    };
    ".config/waybar/style.css" = {
      executable = false;
      source = ./../../modules/waybar.css;
    };
    "wallpaper.mp4" = {
      executable = false;
      source = ./../../medias/wallpapers/silverwolf.mp4;
    };
    "wallpaper.jpg" = {
      executable = false;
      source = ./../../medias/wallpapers/wallpaper.jpg;
    };
  }; 

  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "Cypooos";
      userEmail = "60020572+Cypooos@users.noreply.github.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}