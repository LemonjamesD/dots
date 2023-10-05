{ config, pkgs, machine-settings, secrets, ... }: let

in {
  imports = [
  ] ++ machine-settings.mkSystemModulePaths [
    ./fonts.nix
    ./razer.nix
    ./qmk.nix
    ./pipewire.nix
    ./hyprland.nix
    ./polkit.nix
  ];

  programs.kdeconnect.enable = true;

  environment.systemPackages = with pkgs; [
    ntfs3g

    # Syncing
    syncthing
  ];

  # bluetooth
  hardware.bluetooth.enable = true;

  # Flatpak
  services.flatpak.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  virtualisation.docker.enable = true;

  services.gvfs.enable = true;

  # env vars
  environment.sessionVariables = rec {
    PROGDIR = "/mnt/Programming/CodingShit";
    CC = "clang";
    NIXPKGS_ALLOW_UNFREE = "1";
  };
}
