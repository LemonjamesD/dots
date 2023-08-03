{ config, pkgs, ... }: 

{
  imports = [
    ../shared/tuigreet.nix { cmd = "wmderland"; }
    ../shared/nvidia.nix
  ];

  environment.systemPackages = with pkgs; [
    xorg.xinit
    wmderland
  ];

  services.xserver = {
    enable = true;
    desktopManager.wmderland.enable = true;
  };
}
