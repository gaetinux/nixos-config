{ ... }:

{
  imports = [
    ./packages.nix
    ./sway.nix
    ./waybar.nix
    ./mako.nix
    ./foot.nix
    ./fuzzel.nix
  ];
    
  home.username = "gaetinux";
  home.homeDirectory = "/home/gaetinux";
  home.file."Pictures/wallpaper.png".source = ../../assets/wallpapers/wallpaper.png;

  # Keep this value at the Home Manager version used for the initial setup.
  home.stateVersion = "26.05";
}