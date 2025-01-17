{ inputs, config, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ./modules/+fish.nix
    ./modules/+stylix.nix
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

  environment.systemPackages = with pkgs; [];

  programs = {
    hyprland = {
      enable = true;
      withUWSM  = true; 
    };
  };

  services = {
    udisks2.enable = true;
    upower.enable = true;
    blueman.enable = true;
  };

  users.defaultUserShell = pkgs.fish;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
     
  system.stateVersion = "24.11";

}
