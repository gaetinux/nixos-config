# TODO

## Priority

- [ ] Build the NixOS configuration in CI
- [ ] Restrict `nixpkgs.config.allowUnfree`
- [ ] Review `cliphist` retention and sensitive clipboard data
- [x] Add a LICENSE file (the repository is public but currently unlicensed)
- [ ] Plan a secrets management approach (e.g. sops-nix, agenix) before any
      real credential (VPN, Wi-Fi, tokens) needs to be stored

## Structure

- [ ] Prepare the configuration for additional hosts
- [ ] Document the repository architecture

## Quality

- [ ] Add checks for accidentally committed sensitive files
- [x] Review pinning GitHub Actions to commit SHAs
- [ ] Automate flake input updates (scheduled workflow, Renovate, or
      Dependabot) instead of relying on manual `nix flake update`
- [x] Enable automatic Nix store garbage collection and optimisation
      (`nix.gc.automatic`, `nix.optimise.automatic`) instead of the manual
      commands documented in the README
- [ ] Cache the Nix store in CI to speed up `nix flake check` runs
- [ ] Correct the stale references to foot in `README.md` and ADR 0001:
      the terminal has been Warp since the terminal switch, and foot only
      remains because it sits in the `programs.sway.extraPackages` default
