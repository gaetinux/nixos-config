# 1. Centralise the desktop palette in a typed module

Date: 2026-09-23
Status: accepted

## Context

The palette was written by hand in every module that needed it. The accent
`#a99bc6` appeared in five files, the urgent red `#a54242` in three, and
`FiraCode Nerd Font` in five. Each tool expects a different spelling of the
same colour: Sway `#rrggbb`, swaylock `rrggbb`, fuzzel `rrggbbaa`, Waybar CSS.

Changing one colour meant editing six files and remembering three formats.

## Decision

Declare the palette, font and icon theme once in `home/gaetinux/theme.nix`, as
Home Manager options with no config of their own. Consumers read
`config.theme`.

Colours are typed `types.strMatching "#[0-9a-fA-F]{6}"`, so an invalid value
fails `nix flake check` rather than rendering incorrectly. Two helpers,
`theme.lib.hex` and `theme.lib.hexAlpha`, derive the other spellings from a
single canonical `#rrggbb` value.

A plain attribute set imported by each module was rejected as untyped and
outside the module system; injection through `extraSpecialArgs` was rejected
because it moves the definition into `flake.nix`, away from where it is used.

## Consequences

The palette is smaller than the set of literals it replaced: nine semantic
entries absorb six near-duplicate values that had drifted apart over time
(three near-identical grey-violets, four greys for text). Five small visual
differences followed, all intended and accepted:

- Sway unfocused window: background `#28242f` -> `#2a2938`, title `#777777` -> `#a0a0a0`
- Waybar window title: `#d8d8d8` -> `#ffffff`
- foot foreground: `#e6e6e6` -> `#ffffff`
- fuzzel match in the selected row: `#d0c4ef` -> `#a99bc6`
- swaylock fallback colour: `#3d3d55` -> `#3a3545`

Per-host override works from `home/gaetinux/hosts/<hostname>.nix` without
touching any consumer.

Deliberately out of scope: theme switching, adopting an upstream theme, and
geometry. Border radius, border width and gaps stay local to each application,
where their values are legitimately independent.

If the white foreground proves tiring in foot, the fix is a `textSoft` entry
rather than a literal.
