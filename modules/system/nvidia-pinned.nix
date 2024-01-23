{ system, config, inputs, ... }: let
in {
  imports = [
    ./nvidia.nix
  ];

  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.production;
}
