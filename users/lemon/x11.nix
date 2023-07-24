{ config, pkgs, ... }: 

{
  environment.systemPackages = with pkgs; [
    xorg.xinit
  ];

  services.xserver = {
    enable = true;
    desktopManager.plasma5.enable = true;
  };
}
