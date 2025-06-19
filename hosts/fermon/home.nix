{ pkgs, gui, ... }:{

  home = {
    username = "cypooos"; 
    homeDirectory = "/home/coda";
    sessionVariables = { EDITOR = "code --wait"; };
    stateVersion = "24.05";
  };

  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };
    home-manager.enable = true;
  };
}