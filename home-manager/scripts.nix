{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (writeShellScriptBin "rebuild" ''
      #!/bin/sh
      
      # Initial notification
      notify-send "NixOS" "Starting rebuild..." -i "system-software-update"

      # Run the rebuild with sudo prompt monitoring
      sudo -v  # Prompt for sudo password
      if nh os switch --hostname nixos-hyprland /home/kirkham/MyNixos; then
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
      sudo -v  # Prompt for sudo password
      if nh os switch --hostname nixos-hyprland --update /home/kirkham/MyNixos; then
        notify-send "NixOS" "Update Successful!" -i "dialog-information"
      else
        notify-send "NixOS" "Update Failed!" -i "dialog-error"
      fi
    '')

    (writeShellScriptBin "clean" ''
      #!/bin/sh
      
      # Prompt for sudo password
      sudo -v  # Prompt for sudo password

      # Delete old generations, keeping the last 5
      if ! nix-env --delete-generations --profile /nix/var/nix/profiles/system +5; then
        notify-send "NixOS" "Failed to delete old generations!" -i "dialog-error"
        exit 1
      fi

      # Collect garbage
      if ! nix-collect-garbage; then
        notify-send "NixOS" "Failed to collect garbage!" -i "dialog-error"
        exit 1
      fi

      # Switch to the specified NixOS configuration
      if ! nh os switch --hostname nixos /home/kirkham/MyNixos; then
        notify-send "NixOS" "Failed to switch NixOS configuration!" -i "dialog-error"
        exit 1
      fi

      # Notify on successful completion
      notify-send "NixOS" "Clean operation completed successfully!" -i "dialog-information"
    '')
  ];
} 
