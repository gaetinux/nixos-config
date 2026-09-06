{ ... }:

{
  services.mako = {
    enable = true;

    settings = {
      font = "FiraCode Nerd Font 10";

      background-color = "#2a2938";
      text-color = "#ffffff";
      border-color = "#a99bc6";

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
    };

    extraConfig = ''
      [urgency=high]
      background-color=#33262c
      border-color=#a54242
      default-timeout=0
    '';
  };
}