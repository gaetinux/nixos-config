{ pkgs, ... }:

{
  home.packages = with pkgs; [
    evince
    git
    imv
    keepassxc
    libnotify
    libreoffice
    mpv
    neovim
    networkmanagerapplet
    openfortivpn
    obsidian
    pavucontrol
    polkit_gnome
    remmina
    xdg-user-dirs
  ];
}
