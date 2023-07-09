{ config, lib, pkgs, ... }:

{
  services.espanso = {
    enable = true;
    settings = {
      matches = [
        {
          trigger = ":test:";
          replace = "bitch ass bitch";
        }
      ]
    };
  };
}
