{ pkgs, ... }:

{
  home.packages = with pkgs; [
    glfw-wayland
    vulkan-headers
    vulkan-validation-layers
    vulkan-loader
    
    xorg.libX11 xorg.libXcursor xorg.libXi xorg.libXrandr
    libxkbcommon wayland

    valgrind

    libffi
  ];
}
