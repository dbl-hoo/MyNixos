  { config, pkgs, ... }:
  {
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
  }