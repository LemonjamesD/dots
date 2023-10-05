{ config, pkgs, secrets, username, homeDirectory, stateVersion, machine-settings, inputs, ... }: let

{
  home = {
    inherit username homeDirectory stateVersion;
  };
  
  home.sessionVariables = {
    NIXPKGS_ALLOW_UNFREE = "1";
    NIXPKGS_ALLOW_BROKEN = "1";
  };

  imports = [];
}
