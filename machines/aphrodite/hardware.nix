{ config, pkgs, ... }: 
{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      configurationLimit = 5;
      efiSupport = true;
      # efiInstallAsRemovable = true;
      device = "nodev";
      extraEntries = ''
        menuentry "Reboot" {
          reboot
        }
        menuentry "Poweroff" {
          halt
        }
      '';
    }; 
  };

  # Make some extra kernel modules available to NixOS
  boot.extraModulePackages = with config.boot.kernelPackages;
    [ 
      v4l2loopback.out
    ];

  boot.supportedFilesystems = [ "ntfs" ];

  # hardware.xpadneo.enable = true;

  # Activate kernel modules (choose from built-ins and extra ones)
  boot.kernelModules = [
    # Virtual Camera
    "v4l2loopback"
    # Virtual Microphone, built-in
    "snd-aloop"
    # Uinput
    "uinput"
    "hid_microsoft"
  ];

  services.udev.extraRules = ''
    SUBSYSTEM==usb, ATTR{idVendor}==045e, ATTR{idProduct}==02ea, MODE=0666
  '';

  # Set initial kernel module settings
  # https://github.com/umlaeute/v4l2loopback
  boot.extraModprobeConfig = ''
    options v4l2loopback card_label="Virtual Camera"
  '';
}
