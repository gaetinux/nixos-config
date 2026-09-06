{ ... }:

{
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      # Folders
      "inode/directory" = [ "thunar.desktop" ];
      "application/x-gnome-saved-search" = [ "thunar.desktop" ];

      # Web
      "text/html" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];

      # Text
      "text/plain" = [ "codium.desktop" ];
    };
  };
}