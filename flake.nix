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
  let 
    default = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/fermon/configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };
  in
    {
      nixosConfigurations.default = default;
      nixosConfigurations.fermon = default;
      nixosConfigurations.server = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/server/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
}
