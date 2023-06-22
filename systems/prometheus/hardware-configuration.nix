# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = 
    { device = "none";
      fsType = "tmpfs";
      options = [ "size=10g" "mode=755"];
    };

  fileSystems."/home/lemon" = 
    { device = "none";
      fsType = "tmpfs";
      options = [ "size=10g" "mode=777"];
    };
  
  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/d86571e3-b794-42aa-baef-8ea57756e5cd";
      fsType = "ext4";
    };

  fileSystems."/boot/efi" =
    { device = "/dev/nvme0n1p4";
      fsType = "vfat";
    };
    
  swapDevices =
    [ { device = "/dev/disk/by-uuid/ad0134a5-1404-4733-81e6-c2ea1edebdc6"; }
    ];

  fileSystems."/mnt/Gaming" =
    { device = "/dev/disk/by-uuid/b909f5c5-311d-4750-ba60-ba1f165f2926";
      fsType = "btrfs";
    };

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
