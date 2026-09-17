{ pkgs, ... }:

{
  services.gnome.gnome-keyring.enable = true;

  security.pam.services = {
    greetd.enableGnomeKeyring = true;
    swaylock.enableGnomeKeyring = true;
  };

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    # Sway starts without this flag but emits a warning with NVIDIA.
    extraOptions = [ "--unsupported-gpu" ];
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = ''
          ${pkgs.tuigreet}/bin/tuigreet \
            --time \
            --remember \
            --remember-user-session \
            --asterisks \
            --cmd sway
        '';
        user = "greeter";
      };
    };
  };
}
