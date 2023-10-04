{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Nintendo
    yuzu-mainline
    citra-nightly

    # Retro Games
    retroarchFull
    dolphin-emu
    pcsx2
  ];
}
