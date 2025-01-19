{ inputs, config, pkgs, ... }:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        icon-theme = "Adwaita";
      };
      border = {
        width = 2;
      };
    };
  };
}
