{ pkgs, ... }:

{
  home.packages = [
    (pkgs.vscodium.overrideAttrs (oldAttrs: {
      postInstall = (oldAttrs.postInstall or "") + ''
        wrapProgram $out/bin/codium \
          --add-flags "--password-store=gnome-libsecret"
      '';
    }))
  ];
}