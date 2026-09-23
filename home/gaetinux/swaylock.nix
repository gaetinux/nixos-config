{ config, ... }:

let
  inherit (config.theme) colors fonts;
  inherit (config.theme.lib) hex hexAlpha;

  # Every indicator centre uses the same translucent backdrop.
  backdrop = hexAlpha colors.base "cc";
in
{
  programs.swaylock = {
    enable = true;

    settings = {
      image = "${../../assets/wallpapers/wallpaper-lock.png}";
      scaling = "fill";

      # Appearance
      color = hex colors.surfaceAlt;
      font = fonts.main;
      font-size = 18;

      # Indicator
      indicator-radius = 100;
      indicator-thickness = 7;

      inside-color = backdrop;
      ring-color = hex colors.accentDeep;
      # Fully transparent, not a palette colour: these two would only draw
      # seams around the indicator, so they stay out of the theme.
      line-color = "00000000";
      # Fully transparent, see line-color above.
      separator-color = "00000000";

      # Text
      text-color = hex colors.text;
      key-hl-color = hex colors.accent;

      # Verification
      inside-ver-color = backdrop;
      ring-ver-color = hex colors.accent;
      text-ver-color = hex colors.text;

      # Wrong password
      inside-wrong-color = backdrop;
      ring-wrong-color = hex colors.urgent;
      text-wrong-color = hex colors.text;

      # Clear
      inside-clear-color = backdrop;
      ring-clear-color = hex colors.accentDeep;
      text-clear-color = hex colors.text;

      # Behaviour
      show-failed-attempts = true;
      ignore-empty-password = true;
    };
  };
}
