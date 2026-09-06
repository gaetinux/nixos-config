{ ... }:

{
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        font = "FiraCode Nerd Font:size=11";
        terminal = "foot";
        layer = "overlay";
      };
    };
  };
}