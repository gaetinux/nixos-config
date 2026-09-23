{ config, ... }:

let
  inherit (config.theme) colors fonts icons;
  inherit (config.theme.lib) hexAlpha;

  # fuzzel requires rrggbbaa; the launcher is fully opaque throughout.
  opaque = color: hexAlpha color "ff";
in
{
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        font = "${fonts.main}:size=${toString fonts.size}";
        terminal = "foot";
        layer = "overlay";
        width = 40;
        lines = 10;
        icon-theme = icons.name;
      };

      colors = {
        background = opaque colors.surface;
        text = opaque colors.text;
        prompt = opaque colors.accent;
        input = opaque colors.text;
        match = opaque colors.accent;

        selection = opaque colors.surfaceAlt;
        selection-text = opaque colors.text;
        selection-match = opaque colors.accent;

        border = opaque colors.accent;
      };

      border = {
        width = 2;
        radius = 6;
      };
    };
  };
}
