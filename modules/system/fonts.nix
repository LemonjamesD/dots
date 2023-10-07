{ pkgs, inputs, ... }:

{
  fonts = {
    packages = with pkgs; [
      nerdfonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-extra
      noto-fonts-emoji
      noto-fonts-emoji-blob-bin
      ipafont
    ];
  };
}
