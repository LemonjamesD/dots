{ pkgs, inputs, ... }: 

{
  home.packages = with pkgs; [
    # zig
    inputs.zig
    zls
  ];
}
