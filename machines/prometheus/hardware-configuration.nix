# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "none";
      fsType = "tmpfs";
      options = [ "size=20g" "mode=755" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/e05c9096-a531-434d-b741-9faf8cb3d9ae";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

  fileSystems."/etc/nixos" =
    { device = "/dev/disk/by-uuid/e05c9096-a531-434d-b741-9faf8cb3d9ae";
      fsType = "btrfs";
      options = [ "subvol=nixos" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/15996e55-e55d-4669-b422-cb888f41d7dd";
      fsType = "btrfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/79E6-06D2";
      fsType = "vfat";
    };

  fileSystems."/etc/secrets" =
    { device = "/dev/disk/by-uuid/e05c9096-a531-434d-b741-9faf8cb3d9ae";
      fsType = "btrfs";
      options = [ "subvol=secrets" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/a2c02c12-5269-454d-8cd2-b138da0067ec"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp42s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
