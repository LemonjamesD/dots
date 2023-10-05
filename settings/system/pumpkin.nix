
{ pkgs, secrets, ... }:

{
  # Allow Unfree
  nixpkgs.config = {
    allowUnfree = true;
  };
  # Experimental Features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Host name
  networking.hostName = "aphordite";
  
  # Timezone
  time.timeZone = "America/New_York";
  
  # Locale
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "dvorak";
  };

  # Default User
  users.users.pumpkin = {
    isNormalUser = true;
    initialHashedPassword = secrets.passwd;
    extraGroups = [
      "wheel"
      "video"
      "audio"
    ];
  };

  # CUPS
  services.printing.enable = true;

  # zsh default shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}
