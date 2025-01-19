{ inputs, config, pkgs, ... }:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        icon-theme = "Adwaita";
        terminal = "kitty";
        use-bold = "yes";
      };
      border = {
        width = 2;
      };
    };
  };
}
