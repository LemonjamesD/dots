{ config, pkgs, secrets, username, homeDirectory, stateVersion, machine-settings, inputs, ... }: let
  baseconfig = { allowUnfree = true; };
in {
  home = {
    inherit username homeDirectory stateVersion;
  };
  
  home.sessionVariables = {
    NIXPKGS_ALLOW_UNFREE = "1";
    NIXPKGS_ALLOW_BROKEN = "1";
  };

  imports = [
    ./helix.nix
    ./nvim.nix
    ./spotify.nix
    ./espanso.nix
  ] ++ machine-settings.mkHomeModulePaths [
    ./gaming.nix
    ./haskell.nix
    ./vulkan-glfw.nix
    ./rust.nix
    ./zig.nix
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
    # Matrix Client
    element-desktop

    # Pipewire
    pavucontrol
    # helvum
    noisetorch

    # git
    gitkraken

   # Internet
    nmap

    # Terminal
    kitty
    zsh
    oh-my-zsh
    neofetch
    bat
    eza
    openssl

    # vnc
    tigervnc

    # archives
    unzip

    # something
    grapejuice

    # C
    cmake
    gnumake
    gcc

    # git
    gitoxide
    gitui

    # llvm
    llvm
    lld

    # system tools
    hwinfo
    pciutils

    # Screenshots
    grim
    slurp
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast

    # Imaging tools
    feh
    mpv
    gimp
    # Code source to image
    silicon

    # js
    yarn
    nodejs

    # Python
    python310
    python310Packages.pip
    python310Packages.gpustat
    python310Packages.tkinter
    python310Packages.python-uinput
    tk

    # go
    go

    # editor
    hexyl

    # Borwsers
    firefox
    ungoogled-chromium
    google-chrome

    # Unreal engine {broken}
    # ue4

    # Other
    obsidian
    keepassxc
    libreoffice
    xautoclick
    SDL2
    sqlitebrowser
    youtube-dl
    nvtop
    libqalculate
    htop
    cascadia-code
    blender
    sqlite
    inkscape
    protonvpn-gui
    audacity
    kdenlive
    sccache
    llvmPackages_16.libcxxabi
    poetry
    ntfy-sh
    mono
    vscode
    qbittorrent
    vlc
    docker
    mnemosyne
    qt-video-wlr
    qt6.qtwayland
    immersed-vr
    tmux

    # Controller
    qjoypad
    xboxdrv
    jstest-gtk

    # Bluetooth
    bluez
    bluez-tools
    blueman
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  services.flatpak = {
    remotes = {
      "flathub" = "https://flathub.org/repo/flathub.flatpakrepo";
      "flathub-beta" = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
    };
    packages = [
      "flathub:com.discordapp.Discord//stable"
      "flathub:de.shorsh.discord-screenaudio//stable"
      "flathub:xyz.armcord.ArmCord//stable"
      "flathub:com.valvesoftware.SteamLink//stable"
    ];
  };
}
