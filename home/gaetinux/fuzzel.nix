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
        background = "2a2938ff";
        text = "ffffffff";
        prompt = "a99bc6ff";
        input = "ffffffff";
        match = "a99bc6ff";

        selection = "3a3545ff";
        selection-text = "ffffffff";
        selection-match = "d0c4efff";

        border = "a99bc6ff";
      };

      border = {
        width = 2;
        radius = 6;
      };
    };
  };
}