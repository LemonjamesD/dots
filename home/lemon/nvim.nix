{ pkgs, inputs, ... }:

{
  programs.nixvim = {
    enable = true;

    # colorschemes.catppuccin-frappe.enable = true;
    plugins.lightline.enable = true;
  };
}
