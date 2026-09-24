{ pkgs, inputs, ... }:

{
  # Pulled from nixpkgs-unstable rather than the pinned stable branch.
  #
  # Warp released its client under MIT/AGPL-3.0 at the end of April 2026, after
  # the 26.05 freeze. The stable branch is therefore stuck on 0.2026.04.15,
  # which predates that and is still marked unfree. Unstable carries the free
  # release.
  #
  # Remove this module and move warp-terminal into packages.nix once the repo
  # tracks a NixOS release that includes the open-source version.
  home.packages = [
    inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.warp-terminal
  ];
}
