{ ... }:

{
  imports = [
    ./packages.nix
    ./sway.nix
    ./waybar.nix
  ];
    
  home.username = "gaetinux";
  home.homeDirectory = "/home/gaetinux";

  # Keep this value at the Home Manager version used for the initial setup.
  home.stateVersion = "26.05";
}