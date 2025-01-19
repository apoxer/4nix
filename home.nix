{ inputs, config, pkgs, lib, ... }:

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
    fish.enable = true;
  };
  
  imports = [
    ./modules/nvchad.nix
    inputs.nvchad4nix.homeManagerModule
    ./modules/hyprpanel.nix
    inputs.hyprpanel.homeManagerModules.hyprpanel
    ./modules/land.nix
  ];
}
