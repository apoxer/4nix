{ inputs, config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    extraConfig = "
      window_padding_width 7
      confirm_os_window_close 0
    ";
  };
}
