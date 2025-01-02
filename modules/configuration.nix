{ config, pkgs, system, inputs, ... }:

{
  # imports = [ 
  #   ./hardware-configuration.nix
  # ];

  # System Configuration
  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    # gc = {
    #   automatic = true;
    #   dates = "daily";
    #   options = "--delete-generations +5";
    # };
  };
  system.stateVersion = "24.11"; # Do not change this value!
  nixpkgs.config.allowUnfree = true;

  # Boot Configuration
  boot = {
    initrd.kernelModules = [ "amdgpu" ];
    kernelPackages = pkgs.linuxPackages_zen;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    tmp = {
      useTmpfs = true;
      tmpfsSize = "30%";
    };
    plymouth = {
      enable = true;
    };
    kernelParams = [ "quiet" "splash" "rd.systemd.show_status=false" "rd.udev.log_level=3" "udev.log_priority=3" ];
    consoleLogLevel = 0;
  };

  # Networking
  networking = {
    hostName = "nixos";
    wireless.iwd.enable = true;
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
  };

  environment.systemPackages = with pkgs; [
    greetd.tuigreet
    git
    curl
    gparted # GPT partition tool - has to be installed as a system package to work with hyprland and polkit
  ];

  # Hardware
  hardware = {
    graphics = {
      enable = true;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  # Services
  services = {
    blueman.enable = true;
    libinput.enable = true;
    power-profiles-daemon.enable = true;
    gvfs.enable = true;
    smartd.enable = true;
    fstrim.enable = true;
    avahi.enable = true;
  };

  # Audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Theming
  stylix = {
    enable = true;
    image = ../wallpapers/alley_scene.png;
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

  #enable NH clean
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 5";
    flake = "/home/user/MyNixos";
  };
}
