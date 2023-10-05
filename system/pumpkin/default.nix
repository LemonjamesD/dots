{ ... }:

{
  imports = [
  ] ++ machine-settings.mkSystemModulePaths [
    ./fonts.nix
    ./pipewire.nix
    ./hyprland.nix
  ];
}
