{ config, pkgs, system, inputs, ... }:

{

#Nix settings
nix = 
    {
        settings.experimental-features = [ "nix-command" "flakes" ];
    };
system.stateVersion = "24.11"; # Do not change this value!
nixpkgs.config.allowUnfree = true;
nix.settings.auto-optimise-store = true;
nix.optimise.automatic = true;
nix.optimise.dates = [ "03:45" ];

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

  # networking.interfaces.enp0s20f0u1u1 = {
  # useDHCP = false;
  # ipv4.addresses = [
  #   {
  #     address = "192.168.1.10";
  #     prefixLength = 24;
  #   }
  # ];
  #ipv4.gateway = "192.168.1.1";  # Replace with your gateway's IP
  #nameservers = [ "8.8.8.8" "1.1.1.1" ];  # Use your preferred DNS servers
# };

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
 

  #Programs and Packages
  programs = {
  #   hyprland.enable = true;
  };


  environment.systemPackages = with pkgs; [
    greetd.tuigreet
    git
    curl
    gparted # GPT partition tool - has to be installed as a system package to work with hyprland and polkit
    openssl

        # support both 32-bit and 64-bit applications
    wineWowPackages.stable

    # support 32-bit only
    wine

    # support 64-bit only
    (wine.override { wineBuild = "wine64"; })

    # support 64-bit only
    wine64

    # wine-staging (version with experimental features)
    wineWowPackages.staging

    # winetricks (all versions)
    winetricks

    # native wayland support (unstable)
    wineWowPackages.waylandFull
  ];

  #fonts
  fonts = {
    packages = with pkgs; [
    noto-fonts-emoji
    noto-fonts-cjk-sans
    font-awesome
    material-icons
    nerd-fonts.open-dyslexic
    jetbrains-mono
    ];
  };

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
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };

services.printing = {
    enable  =  true;
    drivers = [ pkgs.hplipWithPlugin ];
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
