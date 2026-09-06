{ pkgs, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    package = null;

    config = {
      modifier = "Mod4";
      terminal = "foot";
      menu = "fuzzel";

      startup = [
        { command = "swaybg -i ~/Pictures/wallpaper.png -m fill"; }
        { command = "waybar"; }
        { command = "mako"; }
        { command = "sleep 0.5 && swaymsg workspace number 1"; }
      ];

      input = {
        "type:keyboard" = {
          xkb_layout = "fr";
        };
      };

      keybindings = let
        modifier = "Mod4";
      in {
        "${modifier}+Return" = "exec foot";
        "${modifier}+Shift+q" = "kill";
        "${modifier}+d" = "exec fuzzel";
        "${modifier}+Shift+v" = "exec cliphist list | fuzzel --dmenu --prompt 'Clipboard: ' | cliphist decode | wl-copy";

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

        # Scratchpad
        #"${modifier}+Shift+minus" = "move scratchpad";
        #"${modifier}+minus" = "scratchpad show";

        # Session
        "${modifier}+Shift+c" = "reload";
        "${modifier}+Shift+e" = "exec swaynag -t warning -m 'Exit Sway?' -B 'Yes' 'swaymsg exit'";

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
        "Print" = "exec grim - | wl-copy";
        "Shift+Print" = "exec grim -g \"$(slurp)\" - | wl-copy";
      };

      window = {
        border = 2;
        titlebar = false;
      };

      colors = {
        focused = {
          border = "#8b7fa8";
          background = "#8b7fa8";
          text = "#ffffff";
          indicator = "#a99bc6";
          childBorder = "#8b7fa8";
        };

        focusedInactive = {
          border = "#3a3545";
          background = "#3a3545";
          text = "#a0a0a0";
          indicator = "#3a3545";
          childBorder = "#3a3545";
        };

        unfocused = {
          border = "#28242f";
          background = "#28242f";
          text = "#777777";
          indicator = "#28242f";
          childBorder = "#28242f";
        };

        urgent = {
          border = "#a54242";
          background = "#a54242";
          text = "#ffffff";
          indicator = "#a54242";
          childBorder = "#a54242";
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