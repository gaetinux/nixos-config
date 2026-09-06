{ pkgs, ... }:

{
  home.packages = with pkgs; [
    thunar
    tumbler
    thunar-archive-plugin
    xarchiver
  ];
}