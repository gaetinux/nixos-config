{
  description = "Gaetan's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosConfigurations.odin = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
            ./hosts/odin/configuration.nix
        ];
    };
  };
}