{ config, pkgs, machine-settings, secrets, ... }: let

in {
  imports = [
    ./settings.nix
  ] ++ machine-settings.mkSystemModulePaths [
    ./system/fonts.nix
    ./system/razer.nix
    ./system/qmk.nix
    ./system/pipewire.nix
    ./system/hyprland.nix
    ./system/polkit.nix
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
