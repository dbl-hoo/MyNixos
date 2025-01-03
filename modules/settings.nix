{ config, pkgs, ... }:
  
{
nix = 
    {
        settings.experimental-features = [ "nix-command" "flakes" ];
    };
system.stateVersion = "24.11"; # Do not change this value!
nixpkgs.config.allowUnfree = true;
  
}