{ ... }:

{
  imports = [
    ./packages.nix
    ./sway.nix
    ./waybar.nix
    ./mako.nix
    ./foot.nix
    ./fuzzel.nix
    ./vscodium.nix
    ./gtk.nix
    ./swaylock.nix
    ./thunar.nix
    ./mime.nix
    ./shell.nix
    ./git.nix
    ./ssh.nix
    ./devops.nix
    ./direnv.nix
    ./xdg.nix
  ];

  home.username = "gaetinux";
  home.homeDirectory = "/home/gaetinux";

  home.file."Images/wallpaper.png".source = ../../assets/wallpapers/wallpaper.png;
  home.file.".local/bin/powermenu" = {
    source = ./scripts/powermenu.sh;
    executable = true;
  };
  home.file.".local/bin/screenshot" = {
    source = ./scripts/screenshot.sh;
    executable = true;
  };

  # Keep this value at the Home Manager version used for the initial setup.
  home.stateVersion = "26.05";
}
