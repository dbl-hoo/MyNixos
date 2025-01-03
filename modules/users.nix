{ config, pkgs, ... }:

{
  # User Configuration
  users.users.kirkham = {
    isNormalUser = true;
    description = "kirkham";
    shell = pkgs.bash;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

}