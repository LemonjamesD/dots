{ config, pkgs, ... }: 

{
  services.xserver.enable = true;
  services.xserver.desktopManager = {
    xterm.enable = true;
    xfce.enable = true;
  };
  services.xserver.displayManager.defaultSession = "xfce";
}
