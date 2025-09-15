{ config, lib, pkgs, gui, ... }:
{
  
  imports =
    [
      ./hardware-configuration.nix
      ./../../modules/default-system.nix
      ./../../modules/default-packages.nix
    ] ++ (if (gui == "hyprland") then
      [./../../modules/hyprland.nix]
    else
      [./../../modules/plasma.nix]
    );
  

    networking.hostName = "fermon"; 
    system.nixos.label = gui + "-test";


    # Enable touchpad support (enabled default in most desktopManager).
    # services.libinput.enable = true;


    # --------------------------------------
    # NVIDIA (?)
    # --------------------------------------
    # --------------------------------------
    # Enable OpenGL
    hardware.graphics = {
      enable = true;
    };

    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {
      modesetting.enable = true;

      powerManagement.enable = false;

      powerManagement.finegrained = false;

      open = false;

      nvidiaSettings = true;

      package = config.boot.kernelPackages.nvidiaPackages.stable;

      prime = {
      # Make sure to use the correct Bus ID values for your system!
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
      };
    };
    # --------------------------------------
    # --------------------------------------
    # --------------------------------------

    environment.variables.EDITOR = "code --wait";

    system.stateVersion = "25.11"; # Do not change

}

