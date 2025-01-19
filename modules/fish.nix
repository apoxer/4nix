{ inputs, config, pkgs, ...}:

{
  programs.fish = {
    enable = true;
    shellInit = "
      if uwsm check may-start
        exec uwsm start hyprland-uwsm.desktop
      end
      set -U fish_greeting
      fish_config prompt choose scales
    ";
  };
}
