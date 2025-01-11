{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    windowManager.sway = {
      enable = true;
      extraPackages = [];
    };
  };
}