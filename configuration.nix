{ config, pkgs, system, inputs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ./fonts.nix
  ];

  # System Configuration
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "24.11"; # Do not change this value!
  nixpkgs.config.allowUnfree = true;

  # Boot Configuration
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Networking
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  # Time and Locale
  time.timeZone = "America/New_York";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  # Input and Display
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
 

  # User Configuration
  users.users.kirkham = {
    isNormalUser = true;
    description = "kirkham";
    shell = pkgs.bash;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Programs and Packages
  programs = {
    hyprland.enable = true;
    zsh.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
        tumbler  # Thumbnails daemon
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    git
    curl
  ];

  # Hardware
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Services
  services = {
    blueman.enable = true;
    libinput.enable = true;
  };

  # Theming
  stylix = {
    enable = true;
    image = ./wallpapers/trooper_still_life_oliver_wetter.png;
    polarity = "dark";
    opacity.terminal = 0.8;
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
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      serif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      sizes = {
        applications = 12;
        terminal = 14;
        desktop = 11;
        popups = 12;
      };
    };
  };
}
