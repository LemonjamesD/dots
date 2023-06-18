{ config, pkgs, ... }: 

{
  environment.systemPackages = with pkgs; [
    plasma-desktop
  ];

  services.xserver.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
}
