{ config, pkgs, secrets, username, homeDirectory, stateVersion, inputs, ... }: let
  baseconfig = { allowUnfree = true; };
in {
  home = {
    inherit username homeDirectory stateVersion;
  };

  imports = [
    ./helix.nix
    ./spotify.nix
    ../shared/gaming.nix
  ];

  home.sessionVariables = {
    NIXPKGS_ALLOW_UNFREE = "1";
    NIXPKGS_ALLOW_BROKEN = "1";
  };

  # Git
  programs.git = {
    enable = true;
    userName = "LemonjamesD";
    userEmail = "lemon@lemonjamesd.com";
    signing = {
      signByDefault = true;
      key = secrets.git-key;
    };
  };

  # zsh
  programs.zsh = {
    enable = true;
    shellAliases = {
      rebuild-system = ''echo -e "\x1b[0;32mNixOs\x1b[0m" && sudo nixos-rebuild switch --flake /etc/nixos --impure && echo -e "\x1b[0;32mHome-manager\x1b[0m" && home-manager switch --flake /etc/nixos --impure'';
      update-dots = ''export GOBACK="$(pwd)" && cd /etc/nixos && git pull && ./update-dots.sh && cd $GOBACK'';
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "darkblood";
    };
  };


  home.packages = with pkgs; [
    # Haguichi
    logmein-hamachi
    haguichi
    
    # Matrix Client
    element-desktop

    # Pipewire
    pavucontrol
    # helvum
    noisetorch

    # Internet
    nmap

    # Terminal
    kitty
    zsh
    oh-my-zsh
    neofetch
    bat
    exa
    openssl

    # vnc
    tigervnc

    # archives
    unzip

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

    # Rust
    rustup
    # rust-analyzer
    pkg-config

    # Screenshots
    grim
    slurp

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

    # Haskell
    haskell.compiler.ghc942
    stack
    cabal-install
    haskellPackages.hindent
    ihp-new

    # Borwsers
    firefox
    ungoogled-chromium

    # Fonts
    nerdfonts

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
    protonvpn-gui
    nvtop
    libqalculate
    htop
    cascadia-code
    blender
    sqlite
    inkscape

    # Controller
    qjoypad
    jstest-gtk

    # Bluetooth
    bluez
    bluez-tools
    blueman
  ] ++ [
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast
  ];

  services.flatpak = {
    remotes = {
      "flathub" = "https://flathub.org/repo/flathub.flatpakrepo";
      "flathub-beta" = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
    };
    packages = [
      "flathub:com.discordapp.Discord"
      "flathub:de.shorsh.discord-screenaudio"
      "flathub:xyz.armcord.ArmCord"
    ];
  };
}
