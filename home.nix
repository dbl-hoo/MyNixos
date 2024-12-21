{ config, pkgs, ... }:
{
  imports = [
    ./hyprland.nix
    ./shell.nix
  ];

  home.username = "kirkham";
  home.homeDirectory = "/home/kirkham";

  # Let home-manager manage itself
  programs.home-manager.enable = true;

  # Packages that should be installed to the user profile
  home.packages = with pkgs; [
    # Terminals
    kitty      # GPU-accelerated terminal emulator
    alacritty  # Fast, GPU-accelerated terminal emulator

    # Browsers
    firefox    # Popular open-source web browser from Mozilla

    # Development
    git        # Distributed version control system
    vscodium   # Open source build of VS Code
    code-cursor      # AI-powered code editor with pair programming features

    # File management and system tools
    xfce.thunar # File manager
    rofi-wayland # Application launcher for Wayland
    libinput     # Library to handle input devices
    hyprland-protocols
    libinput-gestures
    
    # Terminal utilities
    fastfetch   # Fast and feature-rich terminal file manager
    pfetch     # Lightweight system information tool
    btop       # Resource monitor that shows usage and stats
    tree       # Directory listing command that produces a depth-indented listing

  ];

  # Git configuration
  programs.git = {
    enable = true;
    userName = "kirkham";
    userEmail = "jason.kirkham@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # The stateVersion should match your initial NixOS installation version
  home.stateVersion = "25.05";

}
