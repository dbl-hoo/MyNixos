{ config, pkgs, ... }:
  
{
nix = 
    {
        settings.experimental-features = [ "nix-command" "flakes" ];
    };
system.stateVersion = "24.11"; # Do not change this value!
nixpkgs.config.allowUnfree = true;
nix.settings.auto-optimise-store = true;
nix.optimise.automatic = true;
nix.optimise.dates = [ "03:45" ];

}