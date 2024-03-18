{ ... }:

{
  hardware.opengl = { # this fixes the "glXChooseVisual failed" bug, context: https://github.com/NixOS/nixpkgs/issues/47932
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
}
