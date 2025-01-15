{ config, pkgs, ... }:

{
# Theming
  stylix = {
    enable = true;
    image = ../wallpapers/trooper_field.png;
    polarity = "dark";
    opacity.terminal = 0.8;
    targets.gtk.enable = true;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      serif = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      sizes = {
        applications = 14;
        terminal = 16;
        desktop = 14;
        popups = 16;
      };
    };
  };
}
