{ pkgs, ... }:

{
  imports = [
    ./vulkan-glfw.nix
  ];

  
  home.packages = with pkgs; [
    opengl
  ]
}
