{ host }:

if host == "prometheus" then
  "lemon"
else if host == "aphrodite" then
  "pumpkin"
else
  "nixos"