{ ... }:

{
  programs.foot = {
    enable = true;

    settings = {
      main = {
        font = "FiraCode Nerd Font:size=11";
        pad = "8x8";
      };

      scrollback = {
        lines = 10000;
      };

      mouse = {
        hide-when-typing = "yes";
      };
      
      colors-dark = {
        background = "181818";
        foreground = "e6e6e6";
      };
    };
  };
}