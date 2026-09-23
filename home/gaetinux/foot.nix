{ config, ... }:

let
  inherit (config.theme) colors fonts;
  inherit (config.theme.lib) hex;
in
{
  programs.foot = {
    enable = true;

    settings = {
      main = {
        font = "${fonts.main}:size=${toString fonts.size}";
        pad = "8x8";
      };

      scrollback = {
        lines = 10000;
      };

      mouse = {
        hide-when-typing = "yes";
      };

      colors-dark = {
        background = hex colors.base;
        foreground = hex colors.text;
      };
    };
  };
}
