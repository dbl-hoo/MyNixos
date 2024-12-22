{ config, pkgs, ... }:
{
  imports = [
    ./hyprland.nix
    ./shell.nix
    ./waybar.nix
  ];

  home.username = "kirkham";
  home.homeDirectory = "/home/kirkham";

  # Let home-manager manage itself
  programs.home-manager.enable = true;

  # Packages that should be installed to the user profile
  home.packages = with pkgs; [
   
      
    # Development Tools
    #git            # Version control system
    vscodium      # Open source build of VS Code
    code-cursor   # AI-powered code editor

    # System Utilities
    btop          # Resource monitor showing usage and stats
    htop          # Interactive process viewer
    fastfetch     # Quick system information tool
    pfetch        # Minimal system information tool
    tree          # Directory listing in tree format
    killall       # Utility to kill processes by name
    duf           # Disk usage utility (better df)
    ncdu          # NCurses disk usage analyzer
    brightnessctl # Control device brightness
    dosfstools    # Tools for FAT filesystems
    ntfs3g        # NTFS filesystem support
    
    # File Management
    xfce.thunar   # Modern file manager
    file-roller   # Archive manager for GNOME
    bat           # Better cat with syntax highlighting
    eza           # Modern replacement for ls
    ripgrep       # Fast text search tool
    unzip         # ZIP archive extraction
    
    # Wayland Specific
    #rofi-wayland  # Application launcher for Wayland
    grim          # Screenshot utility
    hyprpolkitagent # Authentication agent
    # waybar        # Highly customizable Wayland bar
    
    # Desktop Environment
    libinput              # Input device management
    hyprland-protocols    # Wayland protocols for Hyprland
    libinput-gestures     # Gesture support

    
    # Audio/Video
    ffmpeg        # Multimedia framework
    mpv           # Media player
    pavucontrol   # Audio control panel
    playerctl     # Media player control
    spotify       # Music streaming client
    
    # System Tray Applications
    networkmanagerapplet  # Network management
    
    # Image and Font Management
    imv           # Image viewer
    font-manager  # Font management utility
    
    # Printer Support
    hplip         # HP printer drivers and tools
    
    # Development and System Management
    nh            # Nix helper utilities
    nixfmt-rfc-style # Nix code formatter
    wget          # File download utility
    iwgtk         # Wireless network manager GUI
  ];

  # Program configurations
  programs = {
    firefox.enable = true;
    rofi.enable = true;
    alacritty.enable = true;
    git = {
      enable = true;
      userName = "kirkham";
      userEmail = "jason.kirkham@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # The stateVersion should match your initial NixOS installation version
  home.stateVersion = "25.05";

}
