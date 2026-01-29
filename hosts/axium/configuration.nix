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

    networking.hostName = "axium";
    system.nixos.label = gui + "-axium";

    # Enable touchpad support (enabled default in most desktopManager).
    # services.libinput.enable = true;

    environment.variables.EDITOR = "code --wait";
    environment.variables.LIBVA_DRIVER_NAME = "radeonsi";

    system.stateVersion = "25.05"; # Do not change

}

