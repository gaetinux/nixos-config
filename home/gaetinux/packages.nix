{ pkgs, ... }:

{
  home.packages = with pkgs; [
    claude-code
    discord
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
    pavucontrol
    polkit_gnome
    remmina
    xdg-user-dirs
  ];
}
