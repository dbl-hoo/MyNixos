{
  description = "Kirkham NiOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zen_browser.url = "github:0xc000022070/zen-browser-flake";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-qtutils.url = "github:hyprwm/hyprland-qtutils"; #hyprland qt utils

    # Add Stylix input
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, zen_browser, hyprland-qtutils, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };  # Pass inputs to configuration
      modules = [
        ./modules/configuration.nix
        ./modules/fonts.nix
        ./modules/hardware.nix
        ./modules/settings.nix
        ./modules/boot.nix
        ./modules/users.nix
        ./modules/stylix.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.kirkham = import ./home-manager/home.nix;
          home-manager.extraSpecialArgs = { inherit inputs; };
        }

        stylix.nixosModules.stylix  # Add Stylix module
      ];
    };
  };
}
