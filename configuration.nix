{ config, pkgs, stateVersion, secrets, ... }: let
in {
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  };

  # Make FHS work
  virtualisation.podman.enable = true;
  services.fhs-compat.enable = true;

  users.users.root.initialHashedPassword = secrets.passwd;

  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    firefox
    git
    home-manager
    comma
    hyfetch
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

