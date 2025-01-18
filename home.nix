{ inputs, config, pkgs, ... }:

{
  home = {
    username = "nixy";
    homeDirectory = "/home/nixy";
    stateVersion = "24.11"; # Please read the comment before changing.
    packages = with pkgs; [];
    file = {};
  };
  
  programs = {
    home-manager.enable = true;
  };
  
  imports = [
    ./modules/nvchad.nix
    inputs.nvchad4nix.homeManagerModule
  ];
}
