{ config, pkgs, system, inputs, ... }:

{
  imports = [
    ./hyprland.nix
    ./shell.nix
    ./waybar.nix
    ./scripts.nix
    ./swaync.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./rofi.nix
  ];

  home.username = "kirkham";
  home.homeDirectory = "/home/kirkham";

  home.file."p10k.zsh" = {
    source = ../dotfiles/p10k.zsh;
  };

  # Let home-manager manage itself
  programs.home-manager.enable = true;

  #enable XDG
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  # Packages that should be installed to the user profile
  home.packages = with pkgs; [
   
    #zen browser
    inputs.zen_browser.packages.${pkgs.system}.default

    # Development Tools
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
    lshw          # Hardware information tool
    bitwarden     # Password manager
    
    # File Management
    file-roller   # Archive manager for GNOME
    bat           # Better cat with syntax highlighting
    eza           # Modern replacement for ls
    ripgrep       # Fast text search tool
    unzip         # ZIP archive extraction
    nautilus      # File manager
 
    # Audio/Video
    ffmpeg        # Multimedia framework
    mpv           # Media player
    pavucontrol   # Audio control panel
    playerctl     # Media player control
    spotify       # Music streaming clients
    
    # System Tray Applications
    #networkmanagerapplet  # Network management
    
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

  # styling
  stylix.targets.rofi.enable = false; #disable rofi so that I can use rofi.nix
  gtk = {
    iconTheme = {
      name = "Tela-circle";
      package = pkgs.tela-circle-icon-theme;
    };
    # gtk3.extraConfig = {
    #   gtk-application-prefer-dark-theme = 1;
    # };
    # gtk4.extraConfig = {
    #   gtk-application-prefer-dark-theme = 1;
    # };
  };
  qt = {
    enable = true;
    style.name = "adwaita-dark";
    platformTheme.name = "gtk3";
  };


  # Program configurations
  programs = {
    firefox.enable = true;
    alacritty.enable = true;
    kitty.enable = true;
    foot.enable = true;
    wlogout = {
      enable = true;  # Enable wlogout
    };
    git = {
      enable = true;
      userName = "kirkham";
      userEmail = "jason.kirkham@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
    zed-editor.enable = true;
    zsh.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # se stateVersion should match your initial NixOS installation version
  home.stateVersion = "25.05";

}
