{ config, pkgs, ... }:

{
  # Allow Unfree
  nixpkgs.config = {
    allowUnfree = true;
  };
  # Experimental Features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Host name
  networking.hostName = "prometheus";
  
  # Timezone
  time.timeZone = "America/New_York";
  
  # Locale
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "dvorak-programmer";
  };

  # Default User
  users.users.lemon = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "audio"
    ];
  };

  # CUPS
  services.printing.enable = true;
}
