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

      # PDF
      "application/pdf" = [ "org.gnome.Evince.desktop" ];

      # Images
      "image/png" = [ "imv.desktop" ];
      "image/jpeg" = [ "imv.desktop" ];
      "image/webp" = [ "imv.desktop" ];
      "image/gif" = [ "imv.desktop" ];

      # Video
      "video/mp4" = [ "mpv.desktop" ];
      "video/x-matroska" = [ "mpv.desktop" ];
      "video/webm" = [ "mpv.desktop" ];
    };
  };
}