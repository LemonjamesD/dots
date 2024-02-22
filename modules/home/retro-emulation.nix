{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Nintendo
    yuzu-mainline
    citra-nightly

    # Retro Games
    # retroarchFull # broken
    # dolphin-emu
    # pcsx2
  ];
}
