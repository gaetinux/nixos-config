{ ... }:

{
  programs.waybar = {
    enable = true;

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
          "network"
          "pulseaudio"
          "pulseaudio/slider"
          "tray"
          "custom/power"
          "clock"
        ];

        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
        };

        cpu = {
          format = "CPU {usage}%";
          interval = 2;
        };

        memory = {
          format = "RAM {percentage}%";
          interval = 5;
        };

        network = {
          format-wifi = "󰤨  {signalStrength}%";
          format-ethernet = "󰈀  Ethernet";
          format-disconnected = "󰤭  Offline";
          tooltip-format = "{ifname}: {ipaddr}";
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
        font-family: "FiraCode Nerd Font";
        font-size: 13px;
        border: none;
        border-radius: 0;
      }

      window#waybar {
        background: #181818;
        color: #ffffff;
        border-bottom: 2px solid #2a2938;
      }

      #workspaces button {
        padding: 0 8px;
        color: #a0a0a0;
        background: transparent;
      }

      #workspaces button.focused {
        color: #ffffff;
        background: #2a2938;
        box-shadow: inset 0 -2px #a99bc6;
      }

      #workspaces button.urgent {
        color: #ffffff;
        background: #a54242;
      }

      #window {
        padding: 0 12px;
        color: #d8d8d8;
      }

      #cpu,
      #memory,
      #network,
      #pulseaudio,
      #tray,
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
        background: #2a2938;
      }

      #pulseaudio-slider highlight {
        background: #a99bc6;
      }

      #custom-power {
        color: #a99bc6;
        font-size: 15px;
      }

      #clock {
        font-weight: 600;
      }
    '';
  };
}