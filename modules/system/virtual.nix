{ pkgs, ... }:

{
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "lemon" ];
  virtualisation.virtualbox.host.enableExtensionPack = true;
  boot.kernelModules = [
    "vboxdrv"
    "vboxnetflt"
    "vboxnetadp"
    "vboxpci"
  ];
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  environment.systemPackages = with pkgs; [
    qemu
  ];
  boot.extraModprobeConfig = "options kvm_intel nested=1";
}

