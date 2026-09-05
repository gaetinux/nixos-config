{ ... }:

{
  users.users.gaetinux = {
    isNormalUser = true;
    description = "Gaetan Pawlowski";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
    ];
  };
}