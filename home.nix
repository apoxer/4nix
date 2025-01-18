{ inputs, config, pkgs, ... }:

{
  home = {
    username = "nixy";
    homeDirectory = "/home/nixy";
    stateVersion = "24.11"; # Please read the comment before changing.
    packages = with pkgs; [];
    file = {};
  };
  
  programs.home-manager.enable = true;
  # programs.nvchad = {
  #   enable = true;
  #   backup = false;
  #   chadrcConfig = "
  #     local M = {}
  #     M.nvdash = { load_on_startup = true }
  #     return M
  #   ";
  # };
imports = [
    ./modules/nvchad.nix
    inputs.nvchad4nix.homeManagerModule
  ];
}
