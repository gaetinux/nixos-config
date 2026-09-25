{
  config,
  lib,
  pkgs,
  ...
}:

let
  swaylock = lib.getExe' config.programs.swaylock.package "swaylock";

  # home-manager runs with useGlobalPkgs, so this resolves to the very sway
  # the system already installs: naming it here costs nothing in the closure,
  # and the unit below has no PATH beyond bash.
  swaymsg = lib.getExe' pkgs.sway "swaymsg";
in
{
  services.swayidle = {
    enable = true;

    timeouts = [
      {
        timeout = 600;
        command = "${swaymsg} 'output * power off'";
        resumeCommand = "${swaymsg} 'output * power on'";
      }
      {
        timeout = 900;
        command = "${swaylock} -f";
      }
    ];

    events = {
      before-sleep = "${swaylock} -f";
      # Answers loginctl lock-session, so locking on demand goes through the
      # same path as locking on idle.
      lock = "${swaylock} -f";
    };
  };

  # mpv and Firefox hold a Wayland idle inhibitor while they play; games under
  # Proton do not. Inhibiting on any audio stream keeps the screen alive for
  # both cases without special-casing applications.
  systemd.user.services.sway-audio-idle-inhibit = {
    Unit = {
      Description = "Inhibit swayidle while audio is playing";
      ConditionEnvironment = "WAYLAND_DISPLAY";
      PartOf = [ config.wayland.systemd.target ];
      After = [ config.wayland.systemd.target ];
    };

    Service = {
      Type = "simple";
      ExecStart = lib.getExe' pkgs.sway-audio-idle-inhibit "sway-audio-idle-inhibit";
      Restart = "on-failure";
    };

    Install.WantedBy = [ config.wayland.systemd.target ];
  };
}
