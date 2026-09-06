{ ... }:

{
  wayland.windowManager.sway.config = {
    output = {
      "DP-1" = {
        mode = "1920x1080@74.973Hz";
      };
    };

    input = {
      "5426:70:Razer_Razer_Mamba_Tournament_Edition" = {
        accel_profile = "flat";
        pointer_accel = "0";
      };
    };
  };
}