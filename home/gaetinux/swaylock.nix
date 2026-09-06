{ ... }:

{
  programs.swaylock = {
    enable = true;

    settings = {
      image = "${../../assets/wallpapers/wallpaper-lock.png}";
      scaling = "fill";

      # Appearance
      color = "3d3d55";
      font = "FiraCode Nerd Font";
      font-size = 18;

      # Indicator
      indicator-radius = 100;
      indicator-thickness = 7;

      inside-color = "181818cc";
      ring-color = "8b7fa8";
      line-color = "00000000";
      separator-color = "00000000";

      # Text
      text-color = "ffffff";
      key-hl-color = "a99bc6";

      # Verification
      inside-ver-color = "181818cc";
      ring-ver-color = "a99bc6";
      text-ver-color = "ffffff";

      # Wrong password
      inside-wrong-color = "181818cc";
      ring-wrong-color = "a54242";
      text-wrong-color = "ffffff";

      # Clear
      inside-clear-color = "181818cc";
      ring-clear-color = "8b7fa8";
      text-clear-color = "ffffff";

      # Behaviour
      show-failed-attempts = true;
      ignore-empty-password = true;
    };
  };
}