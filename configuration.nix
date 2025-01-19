{ inputs, config, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ./modules/stylix.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      # grub = {
      #   enable = true;
      #   device = "nodev";
      #   efiSupport = true;
      # };
    };
  };

  networking = {
    hostName = "nixy";
    networkmanager.enable = true;
  };
  
  time.timeZone = "Asia/Kolkata";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users.nixy = {
    isNormalUser = true;
    description = "nixy";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  environment.systemPackages = with pkgs; [
    kitty
    brave
    brightnessctl
    lsd
    bat
    fuzzel
    clipse
    fastfetch
    wl-clipboard
    udiskie
  ];

  programs = {
    git.enable = true;
    neovim.enable = true;
    fish = {
      enable = true;
      shellInit = "
        if uwsm check may-start
          exec uwsm start hyprland-uwsm.desktop
        end
        set -U fish_greeting
        fish_config prompt choose scales
      ";
    };
    yazi.enable = true;
    hyprland = {
      enable = true;
      withUWSM  = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
  };

  services = {
    udisks2.enable = true;
  };

  users.defaultUserShell = pkgs.fish;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
  
  system.stateVersion = "24.11";

}
