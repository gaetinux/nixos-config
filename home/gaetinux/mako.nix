{
  config,
  lib,
  ...
}:

let
  inherit (config.theme) colors fonts;
in
{
  services.mako = {
    enable = true;

    settings = {
      font = "${fonts.main} 10";

      background-color = colors.surface;
      text-color = colors.text;
      border-color = colors.accent;

      border-size = 2;
      border-radius = 6;

      width = 350;
      height = 120;
      margin = "10";
      padding = "12";

      default-timeout = 5000;

      icons = true;
      max-icon-size = 48;

      anchor = "top-right";

      max-history = 50;
    };

    extraConfig = ''
      [urgency=high]
      background-color=${colors.urgentSurface}
      border-color=${colors.urgent}
      default-timeout=0
    '';
  };

  # home-manager writes the configuration but installs no unit, and the unit
  # shipped by the package is not wired to a target. Declare it here so the
  # session starts the daemon instead of sway exec'ing it.
  systemd.user.services.mako = {
    Unit = {
      Description = "Lightweight Wayland notification daemon";
      Documentation = "man:mako(1)";
      ConditionEnvironment = "WAYLAND_DISPLAY";
      PartOf = [ config.wayland.systemd.target ];
      After = [ config.wayland.systemd.target ];
      # The waybar notification module polls makoctl, which would fail until
      # the daemon owns its bus name.
      Before = [ "waybar.service" ];
    };

    Service = {
      # Ready once org.freedesktop.Notifications is owned, which is exactly
      # the guarantee the ordering above needs.
      Type = "dbus";
      BusName = "org.freedesktop.Notifications";
      ExecStart = lib.getExe' config.services.mako.package "mako";
      ExecReload = "${lib.getExe' config.services.mako.package "makoctl"} reload";
    };

    Install.WantedBy = [ config.wayland.systemd.target ];
  };
}
