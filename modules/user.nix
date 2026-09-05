{ pkgs, ... }:

{
  users.users.gaetinux = {
    isNormalUser = true;
    description = "Gaetan Pawlowski";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
    ];

    packages = with pkgs; [
      fzf
      ripgrep
      fd
      gcc

      git
      vscodium
      neovim
      keepassxc
      openfortivpn
      remmina
    ];
  };
}