{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Core Hyprland Utilities
    #hyprland-qtutils      # Hyprland QT utilities
    dunst                # Notification daemon
    libnotify           # Notification library
    grim          # Screenshot utility
    hyprpolkitagent # Authentication agent
    libinput              # Input device management
    hyprland-protocols    # Wayland protocols for Hyprland
    libinput-gestures     # Gesture support
    
    # Screenshots & Recording
    grim                # Screenshot utility
    slurp               # Screen area selection
    wl-clipboard        # Wayland clipboard utilities
    

    
    # Hyprland Add-ons
    hyprpicker          # Color picker
    # wlogout             # Logout menu
    # swaylock-effects    # Screen locker
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {

    workspace = "special:spotify, on-created-empty:[float; center; size 80% 80%] spotify";

    "$mainMod" = "SUPER";
    "$terminal" = "alacritty -e zsh";
    "$fileManager" = "thunar";
    "$menu" = "rofi -show drun";
    "$webBrowser" = "zen";

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      monitor = [
        ",1920x1080,auto,1"
      ];

      exec-once = [
         "waybar"                    # Status bar
        # "dunst"                     # Notification daemon
        # "hyprpaper"                 # Wallpaper daemon
         "nm-applet --indicator"     # Network manager tray icon
        # "blueman-applet"           # Bluetooth tray icon
        "libinput-gestures-setup start"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          # color = "rgba(1a1a1aee)";
        };
      };

      animations = {
        enabled = true;
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "slidevert,0.83,0,0.17,1"
        ];

        animation = [
          "windows, 1, 4, easeOutQuint"
          "fade, 1, 4, easeOutQuint"
          "workspaces, 1, 4, easeOutQuint"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = 1;
        disable_hyprland_logo = true;
      };

      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
        follow_mouse = 1;
        sensitivity = 0;

        touchpad = {
          natural_scroll = false;
        };
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
      };

      # Define the floating Alacritty command with custom zsh config
      "$floatingTerminal" = "alacritty --class floating_term -e zsh";

      # Add window rules for the floating Alacritty
      windowrulev2 = [
        "float,class:^(floating_term)$"
        "size 50% 50%,class:^(floating_term)$"
        "center,class:^(floating_term)$"
        "pin,class:^(floating_term)$"
      ];

      bind = [
        "$mainMod, RETURN, exec, $terminal"
        "$mainMod SHIFT, RETURN, exec, $floatingTerminal"
        "$mainMod SHIFT, S, exec, hyprctl dispatch togglespecialworkspace spotify"
        "$mainMod, Q, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, B, exec, $webBrowser"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, SPACE, exec, $menu"
        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit,"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        # "$mainMod SHIFT, H, movetoworkspacesilent, special"
        # "$mainMod, H, togglespecialworkspace, special"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ", XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ", XF86MonBrightnessDown, exec, brightnessctl s 10%-"

      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];
    };
  };
} 
