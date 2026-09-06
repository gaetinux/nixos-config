{ pkgs, ... }:

{
  home.packages = with pkgs; [
    thunar
    tumbler
    thunar-archive-plugin
    xarchiver
  ];

  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "inode/directory" = [ "thunar.desktop" ];
      "application/x-gnome-saved-search" = [ "thunar.desktop" ];
    };
  };
}