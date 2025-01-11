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
  # programs = {
  #   hyprland.enable = true;
  # };

  environment.systemPackages = with pkgs; [
    greetd.tuigreet
    git
    curl
    gparted # GPT partition tool - has to be installed as a system package to work with hyprland and polkit
    openssl
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

  #enable NH clean
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 5";
    flake = "/home/user/MyNixos";
  };
}
