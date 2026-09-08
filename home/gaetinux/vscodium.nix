{ pkgs, ... }:

let
  vscodium = pkgs.vscodium.overrideAttrs (oldAttrs: {
    postInstall = (oldAttrs.postInstall or "") + ''
      wrapProgram $out/bin/codium \
        --add-flags "--password-store=gnome-libsecret"
    '';
  });
in
{
  programs.vscodium = {
    enable = true;
    package = vscodium;

    profiles.default.extensions = with pkgs.vscode-extensions; [
      redhat.vscode-yaml
      ms-python.python
      ms-kubernetes-tools.vscode-kubernetes-tools
    ];
  };
}