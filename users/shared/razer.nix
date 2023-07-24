{ pkgs, ... }:

{
  hardware.openrazer.enable = true;
  environment.systemPackages = with pkgs; [
    openrazor-daemon
    polychromatic
  ];
}
