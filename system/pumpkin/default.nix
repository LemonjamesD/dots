{ ... }:

{
  imports = [
  ] ++ machine-settings.mkSystemModulePaths [
    ./hyprland.nix
  ];
}
