args@{ config, pkgs, ... }: 

{
  imports = [
    (import ../shared/tuigreet.nix (args // { cmd = "wmserland"; }))
    ../shared/nvidia.nix
  ];

  environment.systemPackages = with pkgs; [
    xorg.xinit
    wmderland
  ];

  services.xserver = {
    enable = true;
  };
  
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-kde ];
  };
}
