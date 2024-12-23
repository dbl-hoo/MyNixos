{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (writeShellScriptBin "rebuild" ''
      #!/bin/sh
      
      # Initial notification
      notify-send "NixOS" "Starting rebuild..." -i "system-software-update"

      # Run the rebuild with sudo prompt monitoring
      sudo -v 2>/dev/null || notify-send "NixOS" "Password required!" -i "dialog-password" -u critical
      if nh os switch --hostname nixos /home/kirkham/mynixos; then
        notify-send "NixOS" "Rebuild Successful!" -i "dialog-information"
      else
        notify-send "NixOS" "Rebuild Failed!" -i "dialog-error"
      fi
    '')

    (writeShellScriptBin "update" ''
      #!/bin/sh
      
      # Initial notification
      notify-send "NixOS" "Starting update..." -i "system-software-update"

      # Run the update with sudo prompt monitoring
      sudo -v 2>/dev/null || notify-send "NixOS" "Password required!" -i "dialog-password" -u critical
      if nh os switch --hostname nixos --update /home/kirkham/mynixos; then
        notify-send "NixOS" "Update Successful!" -i "dialog-information"
      else
        notify-send "NixOS" "Update Failed!" -i "dialog-error"
      fi
    '')
  ];
} 
