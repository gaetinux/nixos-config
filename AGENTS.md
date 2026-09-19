# Repository Guidelines

## Overview

This repository contains personal NixOS configurations managed with Flakes and
Home Manager. It is intended to support multiple hosts over time. `odin` is
the first configured host, but host-specific assumptions must not be placed in
shared modules.

## Repository Layout

- `flake.nix`: flake inputs, formatters, and NixOS host definitions.
- `hosts/<hostname>/`: host-specific system and hardware configuration.
- `modules/`: reusable NixOS modules shared by hosts.
- `home/gaetinux/`: Home Manager configuration for the `gaetinux` user.
- `home/gaetinux/hosts/<hostname>.nix`: host-specific user configuration.
- `assets/`: wallpapers and other repository assets.
- `.github/workflows/`: continuous integration workflows.
- `TODO.md`: planned improvements and maintenance work.

## Configuration Guidelines

- Keep hardware and host-specific settings under the corresponding `hosts/`
  directory.
- Keep reusable system settings in `modules/`.
- Keep user-level applications and desktop configuration in `home/`.
- Preserve personal identity settings and committed hardware configuration when
  they are intentional; they are part of this personal public repository.
- Treat `hardware-configuration.nix` as generated input. Regenerate it for a
  new machine instead of copying it from another host.
- Avoid adding secrets, private keys, access tokens, or credentials to the
  repository.
- Prefer small, focused modules and avoid compatibility code without a concrete
  need.
- Use ASCII for new text unless a localized path or existing configuration
  requires otherwise.

## Formatting and Validation

Run these commands from the repository root after changing Nix files:

```bash
nix fmt
nix flake check
```

Before committing, verify formatting without modifying files:

```bash
nix fmt -- --ci
git diff --check
```

The GitHub Actions workflow runs `nix flake check` and the formatting check.

## Applying Changes

Build or activate the configuration for a host explicitly:

```bash
sudo nixos-rebuild build --flake .#<hostname>
sudo nixos-rebuild switch --flake .#<hostname>
```

After changing a running Sway or Home Manager configuration, reload the
relevant session when necessary. A NixOS rebuild does not automatically reload
every application configuration.

## Changes and Commits

- Keep changes focused on one improvement at a time.
- Update `README.md` when user-facing commands or repository structure change.
- Update `TODO.md` when planned work is completed or new maintenance work is
  identified.
- Use Conventional Commits, for example:
  - `feat(screenshot): save captures to XDG pictures directory`
  - `ci: add Nix formatting and flake checks`
