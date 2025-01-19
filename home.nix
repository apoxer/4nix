{ inputs, config, pkgs, lib, ... }:

{
  home = {
    username = "nixy";
    homeDirectory = "/home/nixy";
    stateVersion = "24.11";
    packages = with pkgs; [
      brave
      hyprpanel
      brightnessctl
      wl-clipboard
      udiskie
      clipse
      emote
      nautilus
      pavucontrol
      eog
      grimblast
      telegram-desktop
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
    mpv.enable = true;
  };
  
  imports = [
    inputs.nvchad4nix.homeManagerModule
    ./modules/nvchad.nix
    ./modules/hyprland.nix
    ./modules/kitty.nix
    ./modules/git.nix
  ];
}
