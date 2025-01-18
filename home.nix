{ inputs, config, pkgs, ... }:

{
  home = {
    username = "nixy";
    homeDirectory = "/home/nixy";
    stateVersion = "24.11";
    packages = with pkgs; [];
    file = {};
  };
  
  programs = {
    home-manager.enable = true;
  };
  
  imports = [
    ./modules/nvchad.nix
    inputs.nvchad4nix.homeManagerModule
    ./modules/hyprpanel.nix
    inputs.hyprpanel.homeManagerModules.hyprpanel
    ./modules/hyprland.nix
  ];
}
