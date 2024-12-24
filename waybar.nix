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
          "hyprland/workspaces"
          "hyprland/window"
        ];
        
        modules-center = [
          "clock"
        ];
        
        modules-right = [
          # "wireplumber"
          "bluetooth"
          "network"
          "battery"
          "power-profiles-daemon"
          "custom/notification"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          sort-by-number = true;
        };

        "hyprland/window" = {
          max-length = 15;
          separate-outputs = false;
          icon = true;
          rewrite = {
            "" = " 🙈 ";
          };
        };


        "bluetooth" = {
          "format-on" = "";
          "format-off" = "󰂲";
          "format-connected" = "󰂱";
          "on-click" = "blueman-manager";
          "tooltip-format" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          "tooltip-format-connected" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          "tooltip-format-enumerate-connected" = "{device_alias}\t{device_address}";
          "tooltip-format-enumerate-connected-battery" = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
        };

        "power-profiles-daemon" = {
          "format" = "{icon}";
          "tooltip-format" = "Power profile = {profile}\nDriver: {driver}";
          "tooltip" = true;
          "format-icons" = {
            "default" = "";
            "performance" = "";
            "balanced" = "";
            "power-saver" = "";
          };
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
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󱘖 {capacity}%";
          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          on-click = "";
          tooltip = false;
        };

        "custom/notification" = {
          tooltip = false;
          format = "{icon}";
          format-icons = {
            notification = "󰂚";
            none = "󰂜";
            dnd-notification = "󱏧";
            dnd-none = "󰂛";
            inhibited-notification = "󰂚";
            inhibited-none = "󰂜";
            dnd-inhibited-notification = "󱏧";
            dnd-inhibited-none = "󰂛";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t";
          escape = true;
        };

        "network" = {
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          format-ethernet = " {bandwidthDownOctets}";
          format-wifi = "{icon} {signalStrength}%";
          format-disconnected = "󰤮";
          tooltip = false;
        };

        "wireplumber" = {
          format = "{volume}% {icon}";
          format-muted = "";
          on-click = "pavucontrol";
          format-icons = [ "" "" "" ];
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
        background: alpha(@base01, 0.8);
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

      #clock,
      #battery,
      #power-profiles-daemon,
      #bluetooth,
      #cpu,
      #memory,
      #network,
      #pulseaudio,
      #wireplumber,
      #custom-notification,
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
