{ config, pkgs, ... }:

let
  inherit (config.theme) colors;
in
{
  wayland.windowManager.sway = {
    enable = true;
    package = null;

    config = {
      modifier = "Mod4";
      terminal = "warp-terminal";
      menu = "fuzzel";

      startup = [
        { command = "swaybg -i ${config.xdg.userDirs.pictures}/wallpaper.png -m fill"; }
        { command = "waybar"; }
        { command = "mako"; }
        { command = "nm-applet --indicator"; }
        {
          command = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        }

        # Start on workspace 1
        { command = "sleep 0.5 && swaymsg workspace number 1"; }
      ];

      input = {
        "type:keyboard" = {
          xkb_layout = "fr";
        };
      };

      focus = {
        followMouse = false;
      };

      modes = {
        resize = {
          "h" = "resize shrink width 10 px";
          "j" = "resize grow height 10 px";
          "k" = "resize shrink height 10 px";
          "l" = "resize grow width 10 px";

          "Left" = "resize shrink width 10 px";
          "Down" = "resize grow height 10 px";
          "Up" = "resize shrink height 10 px";
          "Right" = "resize grow width 10 px";

          "Return" = "mode default";
          "Escape" = "mode default";
        };
      };

      keybindings =
        let
          modifier = "Mod4";
        in
        {
          "${modifier}+Return" = "exec warp-terminal";
          "${modifier}+Shift+q" = "kill";
          "${modifier}+d" = "exec fuzzel";
          "${modifier}+Shift+v" =
            "exec cliphist list | fuzzel --dmenu --prompt 'Clipboard: ' | cliphist decode | wl-copy";
          "${modifier}+r" = "mode resize";

          # Focus
          "${modifier}+h" = "focus left";
          "${modifier}+j" = "focus down";
          "${modifier}+k" = "focus up";
          "${modifier}+l" = "focus right";

          "${modifier}+Left" = "focus left";
          "${modifier}+Down" = "focus down";
          "${modifier}+Up" = "focus up";
          "${modifier}+Right" = "focus right";

          # Move windows
          "${modifier}+Shift+h" = "move left";
          "${modifier}+Shift+j" = "move down";
          "${modifier}+Shift+k" = "move up";
          "${modifier}+Shift+l" = "move right";

          "${modifier}+Shift+Left" = "move left";
          "${modifier}+Shift+Down" = "move down";
          "${modifier}+Shift+Up" = "move up";
          "${modifier}+Shift+Right" = "move right";

          "${modifier}+f" = "fullscreen";
          "${modifier}+Shift+space" = "floating toggle";
          "${modifier}+space" = "focus mode_toggle";

          # Workspace navigation
          "${modifier}+Tab" = "workspace back_and_forth";

          "${modifier}+Control+h" = "workspace prev_on_output";
          "${modifier}+Control+l" = "workspace next_on_output";

          "${modifier}+Control+Left" = "workspace prev_on_output";
          "${modifier}+Control+Right" = "workspace next_on_output";

          # Workspaces
          "${modifier}+ampersand" = "workspace number 1";
          "${modifier}+eacute" = "workspace number 2";
          "${modifier}+quotedbl" = "workspace number 3";
          "${modifier}+apostrophe" = "workspace number 4";
          "${modifier}+parenleft" = "workspace number 5";
          "${modifier}+minus" = "workspace number 6";
          "${modifier}+egrave" = "workspace number 7";
          "${modifier}+underscore" = "workspace number 8";
          "${modifier}+ccedilla" = "workspace number 9";
          "${modifier}+agrave" = "workspace number 10";

          # Move windows to workspaces
          "${modifier}+Shift+ampersand" = "move container to workspace number 1";
          "${modifier}+Shift+eacute" = "move container to workspace number 2";
          "${modifier}+Shift+quotedbl" = "move container to workspace number 3";
          "${modifier}+Shift+apostrophe" = "move container to workspace number 4";
          "${modifier}+Shift+parenleft" = "move container to workspace number 5";
          "${modifier}+Shift+minus" = "move container to workspace number 6";
          "${modifier}+Shift+egrave" = "move container to workspace number 7";
          "${modifier}+Shift+underscore" = "move container to workspace number 8";
          "${modifier}+Shift+ccedilla" = "move container to workspace number 9";
          "${modifier}+Shift+agrave" = "move container to workspace number 10";

          # Layout
          "${modifier}+b" = "splith";
          "${modifier}+v" = "splitv";
          "${modifier}+s" = "layout stacking";
          "${modifier}+w" = "layout tabbed";
          "${modifier}+e" = "layout toggle split";
          "${modifier}+a" = "focus parent";

          # Session
          "${modifier}+Shift+c" = "reload";
          "${modifier}+Shift+e" = "exec ~/.local/bin/powermenu";

          # Audio
          "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
          "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
          "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
          "XF86AudioMicMute" = "exec pactl set-source-mute @DEFAULT_SOURCE@ toggle";

          # Media
          "XF86AudioPlay" = "exec playerctl play-pause";
          "XF86AudioPause" = "exec playerctl play-pause";
          "XF86AudioPrev" = "exec playerctl previous";
          "XF86AudioNext" = "exec playerctl next";
          "XF86AudioStop" = "exec playerctl stop";

          # Brightness
          "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
          "XF86MonBrightnessUp" = "exec brightnessctl set 5%+";

          # Screenshots
          "Print" = "exec ~/.local/bin/screenshot";
          "Shift+Print" = "exec ~/.local/bin/screenshot --area";
        };

      # Applications with a stable home. Criteria are app_id for native
      # Wayland clients and class for XWayland ones.
      assigns = {
        "1" = [ { app_id = "firefox"; } ];
        # Wayland reports app_id, XWayland reports class; match both until the
        # real identifier is confirmed by opening Warp.
        "2" = [
          { app_id = "dev.warp.Warp"; }
          { class = "dev.warp.Warp"; }
        ];
        "3" = [ { app_id = "codium"; } ];
        "4" = [ { app_id = "thunar"; } ];
        "5" = [ { app_id = "org.remmina.Remmina"; } ];
        "6" = [
          { app_id = "^libreoffice.*"; }
          { app_id = "org.gnome.Evince"; }
        ];
        "9" = [ { class = "discord"; } ];
        # Anchored so individual games (steam_app_*) stay where they launch.
        "10" = [ { class = "^[Ss]team$"; } ];
      };

      window = {
        border = 2;
        titlebar = false;

        commands = [
          # Battle.net creates a small auxiliary XWayland window.
          # Hide it in the scratchpad.
          {
            criteria = {
              class = "steam_app_4179891360";
              title = "^$";
            };
            command = "move scratchpad";
          }
        ];
      };

      colors = {
        focused = {
          border = colors.accentDeep;
          background = colors.accentDeep;
          text = colors.text;
          indicator = colors.accent;
          childBorder = colors.accentDeep;
        };

        focusedInactive = {
          border = colors.surfaceAlt;
          background = colors.surfaceAlt;
          text = colors.textMuted;
          indicator = colors.surfaceAlt;
          childBorder = colors.surfaceAlt;
        };

        unfocused = {
          border = colors.surface;
          background = colors.surface;
          text = colors.textMuted;
          indicator = colors.surface;
          childBorder = colors.surface;
        };

        urgent = {
          border = colors.urgent;
          background = colors.urgent;
          text = colors.text;
          indicator = colors.urgent;
          childBorder = colors.urgent;
        };
      };

      gaps = {
        inner = 6;
        outer = 3;
      };

      bars = [ ];
    };
  };

  services.cliphist = {
    enable = true;
    allowImages = true;
  };

  home.packages = with pkgs; [
    brightnessctl
    cliphist
    grim
    playerctl
    slurp
    swaybg
    wl-clipboard
  ];
}
