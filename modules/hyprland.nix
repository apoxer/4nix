{ inputs, config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    settings = {
      "monitor" = ",preferred,auto,1"; 
    };
  };
}
