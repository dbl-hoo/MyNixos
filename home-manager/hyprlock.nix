{ config, pkgs, ... }:

{
  programs = {
    home-manager.enable = true;
    hyprlock = {
      enable = true;
      settings = {
        general = {
          disable_loading_bar = true;
          grace = 5;
          hide_cursor = true;
          no_fade_in = false;
        };

        background = {
          blur_passes = 2;  # More passes = more blur
          blur_size = 4;
          noise = 0.0117;
          contrast = 0.8916;
          brightness = 0.8000;
          vibrancy = 0.1696;
        };
      };
    };
  };
}