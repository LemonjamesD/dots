args@{ config, pkgs, ... }:

{
  imports = [
    (import ../shared/tuigreet.nix (args // { cmd = "startx"; }))
    ../shared/nvidia.nix
  ];

  environment.systemPackages = with pkgs; [
    xorg.xinit
    wmderland
    wofi
  ];

  services.xserver = {
    enable = true;
    displayManager = {
      defaultSession = "none+i3";
    };
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        i3status
        i3lock
        i3blocks
      ];
    };
  };
  
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-kde ];
  };
}
