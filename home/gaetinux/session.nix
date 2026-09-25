{ ... }:

{
  # Waybar renders its tray through the Status Notifier Items protocol, which
  # nm-applet only speaks when asked to.
  xsession.preferStatusNotifierItems = true;

  services.network-manager-applet.enable = true;
  services.polkit-gnome.enable = true;
}
