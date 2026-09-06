{ ... }:

{
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        font = "FiraCode Nerd Font:size=11";
        terminal = "foot";
        layer = "overlay";
        width = 40;
        lines = 10;

        icon-theme = "Papirus-Dark";
      };

      colors = {
        background = "181818ff";
        text = "e6e6e6ff";
        match = "ffffffff";
        selection = "3a3a3aff";
        selection-text = "ffffffff";
        border = "3a3a3aff";
      };

      border = {
        width = 2;
        radius = 6;
      };
    };
  };
}