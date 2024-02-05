{ ... }:

{
  imports = [
    ./nvidia.nix
  ];
  
  hardware.nvidia.open = true;
}
