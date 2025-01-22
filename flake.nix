{
  description = "Kirkham NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zen_browser.url = "github:0xc000022070/zen-browser-flake";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-qtutils.url = "github:hyprwm/hyprland-qtutils";
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, zen_browser, hyprland-qtutils, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    mkSystem = desktop: nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs desktop; };
      modules = [
        ./modules/configuration.nix
      #  ./modules/fonts.nix
        ./modules/hardware.nix
      #  ./modules/settings.nix
      #  ./modules/boot.nix
        ./modules/users.nix
        ./modules/stylix.nix
        ./modules/${desktop}.nix

        home-manager.nixosModules.home-manager
        {
          #home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.kirkham = import ./home-manager/home.nix;
          home-manager.extraSpecialArgs = { inherit inputs desktop; };
        }

        stylix.nixosModules.stylix
      ];
    };
  in {
    nixosConfigurations = {
      nixos-hyprland = mkSystem "hyprland";
      nixos-gnome = mkSystem "gnome";
    };
  };
}
