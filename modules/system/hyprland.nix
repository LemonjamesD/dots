args@{ config, pkgs, machine-settings, inputs, ...}: let

in {
  imports = [
    ./hyprland-tuigreet.nix
  ];

  # make stuff work on wayland
  environment.variables = {
    _JAVA_AWT_WM_NONREPARENTING = "1";
    MOZ_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  environment.systemPackages = with pkgs; [
    wayland
    egl-wayland
    hyprpaper
    mako
    wdisplays
    wlr-randr
    eww-wayland
    wofi
    wofi-emoji
    wl-clipboard

    libsForQt5.qt5.qtwayland
    libsForQt5.polkit-kde-agent
    qt5ct
    libva
  ];

  # Enable polkit
  security.polkit.enable = true;

  programs.hyprland.package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    nvidiaPatches = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ inputs.xdg-desktop-portal-hyprland ];
  };
}