{ inputs, config, pkgs, ... }:

{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = ../walls/pompeii.png;
    polarity = "dark";
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono NF";
      };
      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      emoji = config.stylix.fonts.monospace;   
      sizes = {
        terminal = 14;
        applications = 13;
      };
    };
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
  };

}
