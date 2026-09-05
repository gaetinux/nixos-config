{ pkgs, ... }:

{
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
}