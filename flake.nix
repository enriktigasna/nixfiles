{
  description = "Root configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixvim,
    rust-overlay,
    ...
  }: let
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      desktop = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/desktop/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.maxim = {
              imports = [
                nixvim.homeManagerModules.nixvim
                ./home
              ];
            };
          }
        ];
      };
      laptop = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ({pkgs, ...}: {
            nixpkgs.overlays = [rust-overlay.overlays.default];
            environment.systemPackages = [pkgs.rust-bin.nightly.latest.default];
          })
          ./hosts/laptop/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.maxim = {
              imports = [
                nixvim.homeManagerModules.nixvim
                ./home
              ];
            };
          }
        ];
      };
    };
  };
}
