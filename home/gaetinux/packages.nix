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
    python3
    remmina
    xdg-user-dirs
  ];
}
