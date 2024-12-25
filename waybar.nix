{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 50;
        spacing = 4;
        
        modules-left = [
          "clock"
          "hyprland/window"
        ];
        
        modules-center = [
          "hyprland/workspaces"
        ];
        
        modules-right = [
          "bluetooth"
          "network"
          "battery"
          "power-profiles-daemon"
          "custom/notification"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            "terminal" = "";
            "spotify" = "";
            "default" = " ";
          };
          sort-by-number = true;
          show-special = true;
          # persistent-workspaces = {
          #   "*" = 3;
          # };
        };

        "hyprland/window" = {
          max-length = 25;
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
          on-click = "iwgtk";
          tooltip-format-wifi = "IP: {ipaddr}\nSSID: {essid}\nFrequency: {frequency} MHz";
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
        background: transparent;
        color: @base05;
      }

      .modules-left {
        /* Remove the shared background styling */
        background: transparent;
        margin: 5px;
        padding: 0;
        border-radius: 16px;
      }

      #clock {
        background: @base01;
        margin: 5px;
        padding: 0 10px;
        border-radius: 16px;
      }

      #window {
        background: @base01;
        margin: 5px;
        padding: 0 10px;
        border-radius: 16px;
      }

      .modules-right {
        background: @base01;
        margin: 5px;
        padding: 0 5px;
        border-radius: 16px;
      }

      #workspaces {
        background: transparent;
        margin: 5px;
        padding: 0px 5px;
        border-radius: 16px;
      }

      #workspaces button {
        padding: 0px 5px;
        margin: 3px;
        min-width: 22px;
        border-radius: 16px;
        background: @base01;
        transition: all 0.3s ease-in-out;
        opacity: 1.0;
      }

      #workspaces button:hover {
        opacity:0.5;
      }

      #workspaces button.active {
        background: @base0B;
        border-radius: 16px;
        border: 2px @base07 solid;
        min-width: 25px;
        transition: all 0.3s ease-in-out;
        opacity:1.0;
      }

      #clock,
      #window,
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
        color: #AA336A;
      }

      #battery.critical {
        color: #FF0000;
      }
    '';
  };
}
