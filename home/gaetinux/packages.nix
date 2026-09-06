{ pkgs, ... }:

{
  home.packages = with pkgs; [
    evince
    git
    imv
    keepassxc
    libnotify
    mpv
    neovim
    openfortivpn
    pavucontrol
    remmina
  ];
}