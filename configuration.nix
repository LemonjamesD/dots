{ config, lib, pkgs, stateVersion, secrets, ... }: let
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

  environment.defaultPackages = lib.mkForce [];
  environment.systemPackages = with pkgs; [
    # Setup home-manager
    home-manager

    # Used to look up stuff
    firefox

    # Audio
    pipewire

    # Edit Files
    vim
    helix

    # Get files from the web
    wget
    git

    # Look up stuff
    comma

    # See system info
    hyfetch
    
    # Verify commits and such
    gnupg
    pinentry-curses

    # Replace coreutils
    busybox

    # for zipping/unzipping
    p7zip
    zip
    unzip

    xfce.thunar
  ];

  environment.sessionVariables = rec {
    EDITOR = "hx";
  };

  # Stupid stupid git thing
  # https://github.com/NixOS/nixpkgs/issues/24311
  environment.extraInit = ''
    # Do not want this in the environment. NixOS always sets it and does not
    # provide any option not to, so I must unset it myself via the
    # environment.extraInit option.
    unset -v SSH_ASKPASS
  '';

  # GNUPG
  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "curses";
    enableSSHSupport = true;
  };
  
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

