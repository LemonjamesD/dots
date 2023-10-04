rec {
  host = "prometheus";
  user = import ./functions/machine-match.nix { inherit host; };

  system = "x86_64-linux";
  stateVersion = "23.11";

  system-settings = import "./system/${user}.nix";
  home-settings = import "./home/${user}.nix";

  mkModulePaths = import ./functions/mk-module-path.nix;
}
