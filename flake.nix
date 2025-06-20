# run : SOPS_AGE_KEY_FILE=/etc/sops/age/keys.txt sudo nixos-rebuild switch --flake .#fermonPlasma
{
  description = "My nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # manage my secrets (TODO)
    # to encrypt : sops --age age106rk4ddcad4n0pu3c8slgrhfk3nd6w72plpw8xgv02hs8ywjwgcsslp3ug -e secrets.yaml > secrets.enc.yaml
    # to decrypt : SOPS_AGE_KEY_FILE=/etc/sops/age/keys.txt sops -d secrets.enc.yaml > secrets.yaml
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    # pub age: age1rc228hatcqhxg9sgny8av5npyue4amrrx2m507wy5hklpptq59jsyrrfzy
    # inputs.agenix.url = "github:ryantm/agenix";
    # inputs.agenix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {self, nixpkgs, home-manager, sops-nix} : {
    nixosConfigurations = {
      fermonHypr = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {gui="hyprland";};
        modules = [
          ./hosts/fermon/configuration.nix
          home-manager.nixosModules.home-manager
          sops-nix.nixosModules.sops
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
          sops-nix.nixosModules.sops
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