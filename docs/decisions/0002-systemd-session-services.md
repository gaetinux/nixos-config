# 2. Let systemd own the session services

Date: 2026-09-25
Status: accepted

## Context

Waybar, mako, nm-applet, the polkit agent and swaybg were started from
`wayland.windowManager.sway.config.startup`, as plain `exec` lines in the Sway
configuration. That gave each of them the lifecycle of a shell command: no
ordering between them, no restart on failure, no way to come back after a
crash, and no relationship to the session they belong to.

The consequences were visible. Two `swaybg` processes ran at once: Sway
already spawns one for the default background of each output, and the `exec`
layered a second over it. A crashed Waybar stayed dead until the session was
restarted.

Meanwhile `services.cliphist` already ran as a user unit bound to
`graphical-session.target`, which Sway starts through
`/etc/sway/config.d/nixos.conf`. Two mechanisms coexisted for one job.

## Decision

Bind every session service to `graphical-session.target` as a systemd user
unit, and remove `startup` entirely.

Home Manager ships modules for most of them: `programs.waybar.systemd.enable`,
`services.network-manager-applet` and `services.polkit-gnome`. Mako is the
exception. Its Home Manager module writes the configuration but installs no
unit, and the unit the package ships is not wired to any target, so the unit
is declared in `home/gaetinux/mako.nix`.

That unit keeps the package's `Type=dbus` on `org.freedesktop.Notifications`.
Readiness then means the daemon owns the bus name, which is what allows
`Before=waybar.service` to be a real guarantee rather than a hope: the Waybar
notification module polls `makoctl` on every tick and would fail until the
daemon answers.

`sleep 0.5 && swaymsg workspace number 1` closed the startup list. It looked
like a guard against a startup race, which is why removing it seemed free, and
it is not: it hid a naming bug that has nothing to do with timing. Sway names
the first workspace of an output after the earliest `workspace <name>` binding
in the configuration file, ordered by position and not by number, and Home
Manager serialises the bindings attribute set alphabetically, which sorts
`Mod4+agrave` (workspace 10) ahead of `Mod4+ampersand` (workspace 1). Sessions
opened on workspace 10, and the delayed `swaymsg` switched away from it half a
second later.

`config.defaultWorkspace` fixes that at the source: Home Manager emits the
matching binding ahead of the rest, so the lowest binding order belongs to
workspace 1 and Sway has no reason to pick another name. The `sleep` is not
replaced, it is no longer needed.

The wallpaper moves to an `output "*" { bg ... }` directive. Sway spawns
swaybg itself for whatever background an output declares, so naming the image
there leaves exactly one process instead of two.

Declaring the units by hand for all five was rejected: the Home Manager
modules already encode the ordering, the tray dependency and the
`ConditionEnvironment=WAYLAND_DISPLAY` guard, and reproducing that is
duplication waiting to drift.

## Consequences

A crashed service now restarts on its own, and `systemctl --user restart` acts
on a named unit rather than on a process found by name.

`swaybg` stays in `home.packages`: it is absent from the
`programs.sway.extraPackages` default, and Sway resolves it from PATH.
`polkit_gnome` leaves `home.packages`, since only the unit refers to it, by
absolute store path. `networkmanagerapplet` stays, because the applet opens
`nm-connection-editor` through PATH.

`home.file."Images/wallpaper.png"` is gone. Sway reads the image from the
store, as swaylock already did, so the copy in the home directory had no
remaining consumer.

Activation no longer suffices to pick up changes to these services: a Home
Manager switch restarts the units, but a session that is already running keeps
the processes the previous generation started until it is logged out and back
in.
