{
  description = "basic flake config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mangowc = {
      url = "github:DreamMaoMao/mangowc";
      inputs.nixpkgs.follows = "nixpkgs";
    };
        noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    inputs@{
      stylix,
      mangowc,
      self,
      nixpkgs,
      ...
    }:
    {

      nixosConfigurations.tomtom = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs self; };
        modules = [
          ./configuration.nix
          ./noctalia.nix
          mangowc.nixosModules.mango
          stylix.nixosModules.stylix

        ];
      };
    };
}
