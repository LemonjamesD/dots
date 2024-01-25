{ pkgs, ... }:

{
  
  home.packages = with pkgs; [
    firefox

    keepassxc
  ];
}
