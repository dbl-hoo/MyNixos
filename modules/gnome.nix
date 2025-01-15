{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;  # GNOME Display Manager
    desktopManager.gnome.enable = true;
  };
}
