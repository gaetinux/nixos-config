{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fd
    fzf
    gcc
    git
    keepassxc
    libnotify
    neovim
    openfortivpn
    pavucontrol
    remmina
    ripgrep
    vscodium
  ];
}