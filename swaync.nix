{ config, pkgs, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
  colors = config.lib.stylix.colors;
in
{
  home.file.".config/swaync/config.json".text = ''
    {
      "$schema": "/etc/xdg/swaync/configSchema.json",
      "positionX": "right",
      "positionY": "top",
      "control-center-margin-top": 10,
      "control-center-margin-bottom": 10,
      "control-center-margin-right": 10,
      "notification-icon-size": 64,
      "notification-body-image-height": 100,
      "notification-body-image-width": 200,
      "timeout": 10,
      "timeout-low": 5,
      "timeout-critical": 0,
      "fit-to-screen": true,
      "control-center-width": 500,
      "notification-window-width": 500,
      "keyboard-shortcuts": true,
      "image-visibility": "when-available",
      "transition-time": 200,
      "hide-on-clear": false,
      "hide-on-action": true,
      "script-fail-notify": true
    }
  '';

  home.file.".config/swaync/style.css".text = ''
    * {
      font-family: "OpenDyslexic Nerd Font";
      font-size: 14px;
      color: #${colors.base05};
    }

    .notification-row {
      outline: none;
    }

    .notification-row:focus,
    .notification-row:hover {
      background: #${colors.base02};
    }

    .notification {
      margin: 6px;
      padding: 0;
      border-radius: 10px;
      background: #${colors.base00};
      border: 1px solid #${colors.base0D};
    }

    .notification-content {
      padding: 10px;
      spacing: 10px;
    }

    .close-button {
      padding: 2px;
      margin: 2px;
      border-radius: 5px;
      color: #${colors.base05};
    }

    .close-button:hover {
      background: #${colors.base08}33;
    }

    .notification-default-action {
      padding: 4px;
      margin: 0;
      border-radius: 10px;
    }

    .notification-default-action:hover {
      background: #${colors.base02};
    }

    .notification-label {
      padding: 2px;
      color: #${colors.base05};
    }

    .control-center {
      background: #${colors.base00};
      border: 1px solid #${colors.base0D};
      border-radius: 10px;
    }

    .control-center-list {
      background: transparent;
    }

    .control-center-list-placeholder {
      opacity: 0.5;
    }

    .floating-notifications {
      background: transparent;
    }

    /* When notification center is empty */
    .widget-title {
      color: #${colors.base05};
      margin: 8px;
      font-size: 1.5rem;
    }

    .widget-title > button {
      font-size: initial;
      color: #${colors.base05};
      text-shadow: none;
      background: #${colors.base02};
      border: 1px solid #${colors.base0D};
      box-shadow: none;
      border-radius: 5px;
    }

    .widget-dnd {
      margin: 8px;
      font-size: 1.1rem;
    }

    .widget-dnd > switch {
      border-radius: 5px;
      background: #${colors.base02};
    }

    .widget-dnd > switch:checked {
      background: #${colors.base0D};
    }
  '';
}