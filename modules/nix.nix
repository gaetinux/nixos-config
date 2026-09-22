{ ... }:

{
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Reclaim disk space without running nix-collect-garbage by hand. The times
  # target an evening desktop session rather than the usual nightly slot: the
  # machine is powered off at night, so a nightly timer would only ever run as
  # a catch-up shortly after the next boot.
  nix.gc = {
    automatic = true;
    dates = "Mon 21:30";
    randomizedDelaySec = "900";
    options = "--delete-older-than 30d";
  };

  # Deduplicate identical store paths once the collection has freed what it can.
  nix.optimise = {
    automatic = true;
    dates = [ "Mon 22:15" ];
  };

  # Keep both off the critical path of an interactive session, and never let
  # them overlap when a missed timer makes systemd queue them together.
  systemd.services.nix-gc.serviceConfig = {
    CPUSchedulingPolicy = "idle";
    IOSchedulingClass = "idle";
    Nice = 19;
  };

  systemd.services.nix-optimise.after = [ "nix-gc.service" ];

  # Allow third-party binaries bundled by applications such as Claude Code.
  programs.nix-ld.enable = true;
}
