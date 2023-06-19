{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nerdfonts
    noto-fonts
    noto-fonts-emoji
    noto-fonts-emoji-blob-bin
  ];
}