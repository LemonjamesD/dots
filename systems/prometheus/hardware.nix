{ config, pkgs, ... }: 
{
  imports = [
    ./hardware-configuration.nix
  ];

  # Make my files persist
  # if this fucks up: I cry
  environment.persistence."/nix/persist/system" = {
    directories = [
      "/etc/nixos"
    ];
  };

  boot.loader = {
    efi = {
      # canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      configurationLimit = 5;
      efiSupport = true;
      efiInstallAsRemovable = true;
      device = "nodev";
      extraEntries = ''
        menuentry "Windows" {
          insmod part_gpt
          insmod fat
          insmod search_fs_uuid
          search --fs-uuid --no-floppy --set=root 8C07-315B
          chainloader /EFI/Microsoft/Boot/bootmgfw.efi
        }
        menuentry "Reboot" {
          reboot
        }
        menuentry "Poweroff" {
          halt
        }
      '';
    }; 
  };

  fileSystems."/mnt/Programmador" =
    { device = "/dev/disk/by-uuid/01D78420CB137970";
      fsType = "ntfs";
    };

  fileSystems."/mnt/Programming" =
    { device = "/dev/disk/by-uuid/7BE462B403C20D04";
      fsType = "ntfs";
    };

  # Make some extra kernel modules available to NixOS
  boot.extraModulePackages = with config.boot.kernelPackages;
    [ 
      v4l2loopback.out
    ];

  boot.supportedFilesystems = [ "ntfs" ];

  # Activate kernel modules (choose from built-ins and extra ones)
  boot.kernelModules = [
    # Virtual Camera
    "v4l2loopback"
    # Virtual Microphone, built-in
    "snd-aloop"
    # Uinput
    "uinput"
  ];

  # Set initial kernel module settings
  # https://github.com/umlaeute/v4l2loopback
  boot.extraModprobeConfig = ''
    options v4l2loopback card_label="Virtual Camera"
  '';
}