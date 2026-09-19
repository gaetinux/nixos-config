{ ... }:

{
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Allow third-party binaries bundled by applications such as Claude Code.
  programs.nix-ld.enable = true;
}
