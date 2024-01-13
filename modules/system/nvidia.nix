{ ... }:

{
  environment.variables = {
    "MUTTER_DEBUG_KMS_THREAD_TYPE" = "user";
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.modesetting.enable = true;
  hardware.opengl = { # this fixes the "glXChooseVisual failed" bug, context: https://github.com/NixOS/nixpkgs/issues/47932
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
}
