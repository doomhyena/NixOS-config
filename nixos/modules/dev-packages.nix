{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btop 
    brave
    canon-cups-ufr2
    ccacheWrapper
    claude-code
    cmakeCurses
    cmatrix
    cmake
    cnijfilter2
    docker-compose
    dbeaver-bin
    dpkg
    dotnet-sdk_8 
    fastfetch
    flatpak
    gdb
    git
    gnumake
    gcc
    go 
    gradle 
    jetbrains.idea-oss
    jetbrains.rider
    k9s
    kubectl
    kubernetes-helm
    kdePackages.korganizer
    kind
    lazydocker
    libreoffice
    localsend
    mangohud
    maven 
    mono
    neovim
    nodejs_22
    obsidian
    oh-my-posh 
    pnpm 
    pkg-config
    gtk2
    gtk3
    python312 
    python312Packages.pip
    simple-scan
    spotify
    teams-for-linux
    thunderbird
    torrent7z
    typescript
    unrar
    unzip 
    wget 
    winboat
    webkitgtk_6_0
    wl-clipboard 
    vesktop
    vimPlugins.LazyVim
    vscode
  ];

  programs.java = {
    enable = true;
    package = pkgs.jdk21.override { enableJavaFX = true; };
  };
}
