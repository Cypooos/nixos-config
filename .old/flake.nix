{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland"; 
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: 
    {
      nixosConfigurations.fermon = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs; graphic="plasma";};
        modules = [
          ./hosts/fermon/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
      nixosConfigurations.fermonPlasma = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs; graphic="plasma";};
        modules = [
          ./hosts/fermon/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
      nixosConfigurations.fermonHypr = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs; graphic="hyprland";};
        modules = [
          ./hosts/fermon/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
      nixosConfigurations.server = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/server/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
}
