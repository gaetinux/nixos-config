{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
    ../../modules/user.nix
    ../../modules/sway.nix
    ../../modules/nvidia.nix
    ../../modules/audio.nix
  ];

  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages;

  networking.hostName = "odin"; 

  # Gaming
  programs.steam.enable = true;

  # Virtualization
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  environment.systemPackages = with pkgs; [
    dnsmasq
  ];

  # Keep this value at the NixOS version used for the initial installation.
  system.stateVersion = "26.05";
}
