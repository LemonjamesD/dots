{ pkgs, ... }:

{
  virtualisation.waydroid.enable = true;
  programs.adb.enable = true;
  services.udev.packages = with pkgs; [
    android-udev-rules
  ];
  environment.systemPackages = with pkgs; [
    android-studio
  ];
}
