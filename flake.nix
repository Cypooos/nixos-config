# run : SOPS_AGE_KEY_FILE=/etc/sops/age/keys.txt sudo nixos-rebuild switch --flake .#fermonPlasma
{
  description = "My nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {self, nixpkgs, home-manager} : {
    nixosConfigurations = {
      fermonHypr = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {gui="hyprland";};
        modules = [
          ./hosts/fermon/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.cypooos = ./hosts/fermon/home.nix;
            home-manager.extraSpecialArgs = {gui="hyprland";};
          }
        ];
      };
      fermonPlasma = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {gui="plasma";};
        modules = [
          ./hosts/fermon/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.cypooos = ./hosts/fermon/home.nix;
            home-manager.extraSpecialArgs = {gui="plasma";};
          }
        ];
      };
    };
  };
}