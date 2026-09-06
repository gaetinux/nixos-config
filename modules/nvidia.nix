{ ... }:

{
  hardware.graphics.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
    powerManagement.enable = false;
  };

  systemd.services.greetd.serviceConfig = {
    Environment = [
      "__GLX_VENDOR_LIBRARY_NAME=nvidia"
    ];
  };
}