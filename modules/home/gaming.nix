{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Record Games
    obs-studio

    # Various Games
    lutris

    # Minecraft
    prismlauncher
    jdk17_headless

    # Steam/Proton
    protontricks
    protonup-ng
    steam

    # Wine
    wineWowPackages.stable
    bottles
    winetricks

    # Controller
    qjoypad
    jstest-gtk
    sc-controller

    # OSU
    osu-lazer-bin

    # Retro Games
    retroarchFull
    dolphin-emu
    pcsx2
  ];
}
