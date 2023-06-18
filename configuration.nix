{ config, pkgs, stateVersion, ... }: let
in {
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  };

  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    firefox
    git
    home-manager
    comma
  ];
  
  # Remove old builds
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  system.autoUpgrade.enable = true;
  system.stateVersion = stateVersion;
}

