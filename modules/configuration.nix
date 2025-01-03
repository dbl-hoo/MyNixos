{ config, pkgs, system, inputs, ... }:

{


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
