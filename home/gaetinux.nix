{ pkgs, ... }:

{
  home.username = "gaetinux";
  home.homeDirectory = "/home/gaetinux";

  home.packages = with pkgs; [
    fzf
    ripgrep
    fd
    gcc
    git
    vscodium
    neovim
    keepassxc
    openfortivpn
    remmina
  ];

  # Keep this value at the Home Manager version used for the initial setup.
  home.stateVersion = "26.05";
}