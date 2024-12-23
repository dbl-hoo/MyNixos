{ config, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 4;
        
        modules-left = [
          "clock"
          "hyprland/window"
        ];
        
        modules-center = [
          "hyprland/workspaces"
        ];
        
        modules-right = [
          "pulseaudio"
          "network"
          "cpu"
          "memory"
          "battery"
          "tray"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          sort-by-number = true;
        };

        "clock" = {
          format = "{:%H:%M}";
          format-alt = "{:%Y-%m-%d}";
          tooltip-format = "{:%Y-%m-%d | %H:%M}";
        };

        "cpu" = {
          format = "CPU {usage}%";
          tooltip = false;
        };

        "memory" = {
          format = "RAM {}%";
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-icons = ["" "" "" "" ""];
        };

        "network" = {
          format-wifi = "WiFi ({signalStrength}%) ";
          format-ethernet = "Ethernet ";
          format-disconnected = "Disconnected ⚠";
          tooltip-format = "{ifname} via {gwaddr}";
        };

        "pulseaudio" = {
          format = "{volume}% {icon}";
          format-muted = "Muted ";
          format-icons = {
            default = ["" "" ""];
          };
        };

        "tray" = {
          icon-size = 21;
          spacing = 10;
        };
      };
    };

    style = ''
      * {
        border: none;
        font-family: "OpenDyslexic Nerd Font";
        border-radius: 0;
        font-size: 16px;
        min-height: 0;
      }

      window#waybar {
        background: transparent;
        color: @base05;
      }

      #workspaces button {
        padding: 0 5px;
        background: transparent;
        color: @base05;
      }

      #workspaces button:hover {
        background: @base02;
      }

      #workspaces button.active {
        background: @base0D;
        color: @base00;
      }

      /* Group modules for proper rounding */
      .modules-left {
        background: @base00;
        border-radius: 10px 0 0 10px;
        padding: 0 10px;
      }

      .modules-center {
        background: @base00;
        border-radius: 10px;
        padding: 0 10px;
      }

      .modules-right {
        background: @base00;
        border-radius: 0 10px 10px 0;
        padding: 0 10px;
      }

      #clock,
      #battery,
      #cpu,
      #memory,
      #network,
      #pulseaudio,
      #tray {
        padding: 0 10px;
        margin: 0 5px;
      }

      #battery.warning {
        color: @base0A;
      }

      #battery.critical {
        color: @base08;
      }
    '';
  };
}
