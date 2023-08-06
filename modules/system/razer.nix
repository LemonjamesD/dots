{ pkgs, ... }:

{
  hardware.openrazer = {
    enable = true;
    users = [ "lemon" ];
  };
  environment.systemPackages = with pkgs; [
    openrazer-daemon
    polychromatic
  ];
  boot.kernelModules = [
    "openrazer"
  ];
}
