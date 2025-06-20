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
  }; 

  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true; # see note on other shells below
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