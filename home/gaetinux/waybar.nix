{ config, ... }:

let
  inherit (config.theme) colors fonts;
in
{
  programs.waybar = {
    enable = true;

    # Started by the session rather than by a sway exec, so the bar comes back
    # on its own after a crash and restarts with a home-manager switch.
    systemd.enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;

        modules-left = [
          "sway/workspaces"
          "sway/mode"
        ];

        modules-center = [
          "sway/window"
        ];

        modules-right = [
          "cpu"
          "memory"
          "pulseaudio"
          "pulseaudio/slider"
          "tray"
          "custom/notifications"
          "custom/power"
          "clock"
        ];

        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          format = "{name} {windows}";
          format-window-separator = " ";
          window-rewrite-default = "";
          window-rewrite = {
            "class<firefox>" = "";
            "class<dev.warp.Warp>" = "";
            "class<codium>" = "󰨞";
            "class<com.vscodium.codium>" = "󰨞";
            "class<thunar>" = "";
            "class<Thunar>" = "";
            "class<steam>" = "";
            "class<Steam>" = "";
            "class<libreoffice.*>" = "";
            "class<evince>" = "";
            "class<org.gnome.Evince>" = "";
            "class<imv>" = "";
            "class<mpv>" = "";
            "class<keepassxc>" = "󰌋";
            "class<org.keepassxc.KeePassXC>" = "󰌋";
            "class<org.remmina.Remmina>" = "󰢹";
            "class<discord>" = "󰙯";
          };
        };

        cpu = {
          format = "CPU {usage}%";
          interval = 2;
        };

        memory = {
          format = "RAM {percentage}%";
          interval = 5;
        };

        pulseaudio = {
          format = "󰕾  {volume}%";
          format-muted = "󰝟  Muted";
        };

        "pulseaudio/slider" = {
          min = 0;
          max = 100;
          orientation = "horizontal";
        };

        tray = {
          spacing = 10;
        };

        "custom/notifications" = {
          format = "󰂚 {}";
          exec = "~/.local/bin/notifications count";
          interval = 5;
          tooltip = false;
          on-click = "~/.local/bin/notifications show";
        };

        "custom/power" = {
          format = "⏻";
          tooltip = false;
          on-click = "~/.local/bin/powermenu";
        };

        clock = {
          format = "{:%H:%M}";
          format-alt = "{:%A %d %B %Y}";
          tooltip-format = "<tt>{calendar}</tt>";
        };
      };
    };

    style = ''
      * {
        font-family: "${fonts.main}";
        font-size: 13px;
        border: none;
        border-radius: 0;
      }

      window#waybar {
        background: ${colors.base};
        color: ${colors.text};
        border-bottom: 2px solid ${colors.surface};
      }

      #workspaces button {
        padding: 0 8px;
        color: ${colors.textMuted};
        background: transparent;
      }

      #workspaces button.focused {
        color: ${colors.text};
        background: ${colors.surface};
        box-shadow: inset 0 -2px ${colors.accent};
      }

      #workspaces button.urgent {
        color: ${colors.text};
        background: ${colors.urgent};
      }

      #window {
        padding: 0 12px;
        color: ${colors.text};
      }

      #cpu,
      #memory,
      #pulseaudio,
      #tray,
      #custom-notifications,
      #custom-power,
      #clock {
        padding: 0 10px;
      }

      #pulseaudio-slider {
        min-width: 80px;
        padding: 0 8px;
      }

      #pulseaudio-slider slider {
        min-width: 8px;
        min-height: 8px;
      }

      #pulseaudio-slider trough {
        min-width: 80px;
        min-height: 4px;
        background: ${colors.surface};
      }

      #pulseaudio-slider highlight {
        background: ${colors.accent};
      }

      #custom-power {
        color: ${colors.accent};
        font-size: 15px;
      }

      #clock {
        font-weight: 600;
      }
    '';
  };
}
