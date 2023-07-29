{ config, pkgs, secrets, ... }: let
  wayland = true;
  backend = if wayland then
    ./wayland.nix
  else
    ./x11.nix;
in {
  imports = [
    backend
    ./polkit.nix
    ./settings.nix
    ../shared/fonts.nix
    ../shared/razer.nix
    # fucking broken don't feel like fixing lol!!!!
    # ../shared/protonvpn.nix
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

  # Enable sound.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };
  
  services.gvfs.enable = true;

  # env vars
  environment.sessionVariables = rec {
    PROGDIR = "/mnt/Programming/CodingShit";
    CC = "clang";
    NIXPKGS_ALLOW_UNFREE = "1";
  };
}
