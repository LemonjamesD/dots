{ config, pkgs, ... }: 

{
  imports = [
    ../shared/nvidia.nix
  ];

  environment.systemPackages = with pkgs; [
    xorg.xinit
  ];

  services.xserver = {
    enable = true;
    desktopManager.plasma5.enable = true;
    displayManager.sddm.enable = true;
  };
}
