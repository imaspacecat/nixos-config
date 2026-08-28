{
  description = "Standard NixOS System Flake Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      sops-nix,
      home-manager,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        loaner = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./host/loaner/configuration.nix

            sops-nix.nixosModules.sops

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.spacecat = import ./home.nix;
            }
          ];
        };
      };
    };
}
