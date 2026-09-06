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
          "tray"
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
          on-click = "pavucontrol";
        };

        tray = {
          spacing = 10;
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
        background: rgba(24, 24, 24, 0.96);
        color: #e6e6e6;
      }

      #workspaces button {
        padding: 0 8px;
        color: #a0a0a0;
        background: transparent;
      }

      #workspaces button.focused {
        color: #ffffff;
        background: #3a3a3a;
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
      #clock {
        padding: 0 10px;
      }

      #clock {
        font-weight: 600;
      }
    '';
  };
}