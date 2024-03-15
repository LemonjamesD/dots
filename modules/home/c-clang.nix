{ pkgs, ... }:

{
  home.packages = with pkgs; [
    clang
    pkg-config
    cmake
  ];
}
