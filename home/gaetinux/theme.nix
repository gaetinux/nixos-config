{ lib, pkgs, ... }:

let
  inherit (lib) mkOption types;

  mkColor =
    default: description:
    mkOption {
      type = types.strMatching "#[0-9a-fA-F]{6}";
      inherit default description;
    };
in
{
  options.theme = {
    colors = {
      base = mkColor "#181818" "Darkest background: bar, terminal, lock screen.";
      surface = mkColor "#2a2938" "Raised surfaces: notifications, launcher, bar accents.";
      surfaceAlt = mkColor "#3a3545" "Selected or inactive surfaces.";
      accent = mkColor "#a99bc6" "Active borders, highlights and prompts.";
      accentDeep = mkColor "#8b7fa8" "Darker accent variant.";
      text = mkColor "#ffffff" "Primary text.";
      textMuted = mkColor "#a0a0a0" "Secondary text.";
      urgent = mkColor "#a54242" "Alerts, urgent windows, wrong password.";
      urgentSurface = mkColor "#33262c" "Background of urgent notifications.";
    };

    fonts = {
      main = mkOption {
        type = types.str;
        default = "FiraCode Nerd Font";
        description = "Font family shared by the desktop components.";
      };

      size = mkOption {
        type = types.int;
        default = 11;
        description = "Base point size, used by foot and fuzzel.";
      };
    };

    icons = {
      name = mkOption {
        type = types.str;
        default = "Papirus-Dark";
        description = "Icon theme name.";
      };

      package = mkOption {
        type = types.package;
        default = pkgs.papirus-icon-theme;
        defaultText = lib.literalExpression "pkgs.papirus-icon-theme";
        description = "Package providing the icon theme.";
      };
    };

    lib = mkOption {
      type = types.attrsOf types.raw;
      readOnly = true;
      description = ''
        Colour format helpers, for tools that reject the leading "#".

        hex      "#a99bc6"      -> "a99bc6"
        hexAlpha "#181818" "cc" -> "181818cc"
      '';
      default = {
        hex = color: lib.removePrefix "#" color;
        hexAlpha = color: alpha: "${lib.removePrefix "#" color}${alpha}";
      };
    };
  };
}
