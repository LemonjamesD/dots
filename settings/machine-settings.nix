{
  host = "prometheus";
  user = import ./functions/machine-match.nix { host };

  system = "x86_64-linux";
  stateVersion = "23.11";

  system-settings = import ./system-settings.nix;
  home-settings = import ./home-settings.nix;
}
