{ inputs, config, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
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

  nixpkgs.config.allowUnfree = true;
  users.defaultUserShell = pkgs.fish;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  environment.systemPackages = with pkgs; [
    brightnessctl
    kitty
    brave
    wl-clipboard
    home-manager
    nautilus
  ];

programs = {
  hyprland.enable = true;
  git.enable = true;
  yazi.enable = true;
  neovim.enable = true;
  fish.enable = true;
};

system.stateVersion = "24.11";

}
