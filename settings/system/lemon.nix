{ pkgs, secrets, ... }:

{
  # Should fix bluetnooth controll thing
  boot.extraModprobeConfig = '' options bluetooth disable_ertm=1 '';

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
    keyMap = "dvorak";
  };

  # Default User
  users.users.lemon = {
    isNormalUser = true;
    initialHashedPassword = secrets.passwd;
    extraGroups = [
      "wheel"
      "video"
      "audio"
      "openrazor"
    ];
  };

  # CUPS
  services.printing.enable = true;

  # zsh default shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}
