{ config, pkgs, machine-settings, secrets, ... }: let

in {
  imports = [
  ] ++ machine-settings.mkSystemModulePaths [
    ./nvidia-open.nix
    ./nvidia-pinned.nix
    ./fonts.nix
    ./razer.nix
    ./qmk.nix
    ./pipewire.nix
    # ./plasma.nix
    ./hyprland.nix
    ./polkit.nix
    # ./android.nix
    ./virtual.nix
  ];

  programs.kdeconnect.enable = true;

  environment.systemPackages = with pkgs; [
    ntfs3g

    # Syncing
    syncthing

    linuxKernel.packages.linux_zen.xone
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
  hardware.xpadneo.enable = true;
  hardware.xone.enable = true; 
}
