{ system, config, inputs, ... }: let
  pkgs-nvidia = import inputs.nixpkgs-nvidia { inherit system; };
in {
  imports = [
    ./nvidia.nix
  ];

  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  boot.kernelPackages = pkgs-nvidia.linuxPackages_latest;
}
