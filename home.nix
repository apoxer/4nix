{ inputs, config, pkgs, lib, ... }:

{
  home = {
    username = "nixy";
    homeDirectory = "/home/nixy";
    stateVersion = "24.11";
    packages = with pkgs; [
      brave
      brightnessctl
      clipse
      wl-clipboard
      udiskie
      ventoy-full
      clipse
      popsicle
      nautilus
    ];
    file = {};
  };
  
  programs = {
    home-manager.enable = true;
    yazi.enable = true;
    fuzzel.enable = true;
    bat.enable = true;
    lsd.enable = true;
    fastfetch.enable = true;
  };
  
  imports = [
    inputs.nvchad4nix.homeManagerModule
    inputs.hyprpanel.homeManagerModules.hyprpanel
    ./modules/nvchad.nix
    ./modules/hyprpanel.nix
    ./modules/hyprland.nix
    ./modules/kitty.nix
    ./modules/git.nix
  ];
}
