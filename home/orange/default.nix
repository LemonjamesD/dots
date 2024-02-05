{ pkgs, ... }:

{
  imports = [
    ../lemon/helix.nix
    ../lemon/spotify.nix
  ] ++ machine-settings.mkHomeModulePaths [
    ./gaming.nix
    ./vulkan-glfw.nix
    ./rust.nix
    ./zig.nix
    ./graphics.nix
  ];

  # Git
  programs.git = {
    enable = true;
    userName = "LemonjamesD";
    userEmail = "lemon@lemonjamesd.com";
    signing = {
      signByDefault = true;
      key = secrets.git-key;
    };
    extraConfig = {
      credential.helper = "store";
      safe.directory = "*";
      init.defaultBranch = "main";
    };
  };

  # zsh
  programs.zsh = {
    enable = true;
    shellAliases = {
      rebuild-system = ''echo -e "\x1b[0;32mNixOs\x1b[0m" && sudo nixos-rebuild switch --flake /etc/nixos --impure && echo -e "\x1b[0;32mHome-manager\x1b[0m" && home-manager switch --flake /etc/nixos --impure'';
      rebuild-system-trace = ''echo -e "\x1b[0;32mNixOs\x1b[0m" && sudo nixos-rebuild switch --show-trace --flake /etc/nixos --impure && echo -e "\x1b[0;32mHome-manager\x1b[0m" && home-manager switch --show-trace --flake /etc/nixos --impure'';
      update-dots = ''export GOBACK="$(pwd)" && cd /etc/nixos && git pull && ./update-dots.sh && cd $GOBACK'';
      notif = "ntfy send";
      "..." = "../..";
      "...." = "../../..";
      "....." = "../../../..";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "darkblood";
    };
  };

  home.sessionPath = [
    "$HOME/.cargo/bin"
    "/usr/bin"
  ];

  
  home.packages = with pkgs; [
    # Browser
    firefox
    google-chrome

    # Network
    netcat
    socat

    # Password
    keepassxc
  ];
}
