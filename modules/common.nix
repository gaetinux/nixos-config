{ pkgs, ... }:

{
  # Localization
  time.timeZone = "Europe/Paris";

  i18n.defaultLocale = "fr_FR.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  services.xserver.xkb.layout = "fr";
  console.keyMap = "fr";

  # Networking
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
  services.tailscale.enable = true;

  # System
  nixpkgs.config.allowUnfree = true;
  services.printing.enable = true;

  # Applications
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  programs.firefox.enable = true;

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

  # Utilities
  environment.systemPackages = with pkgs; [
    htop
    papirus-icon-theme
  ];
}