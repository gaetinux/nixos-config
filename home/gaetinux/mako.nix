{ config, ... }:

let
  inherit (config.theme) colors fonts;
in
{
  services.mako = {
    enable = true;

    settings = {
      font = "${fonts.main} 10";

      background-color = colors.surface;
      text-color = colors.text;
      border-color = colors.accent;

      border-size = 2;
      border-radius = 6;

      width = 350;
      height = 120;
      margin = "10";
      padding = "12";

      default-timeout = 5000;

      icons = true;
      max-icon-size = 48;

      anchor = "top-right";

      max-history = 50;
    };

    extraConfig = ''
      [urgency=high]
      background-color=${colors.urgentSurface}
      border-color=${colors.urgent}
      default-timeout=0
    '';
  };
}
