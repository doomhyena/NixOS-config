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
    cnijfilter2
    docker-compose
    dbeaver-bin
    dotnet-sdk_8 
    fastfetch
    flatpak
    git 
    go gradle 
    jetbrains.idea-oss
    jetbrains.rider
    k9s
    kubectl
    kubernetes-helm
    kind
    lazydocker
    libreoffice
    localsend
    mangohud
    maven 
    nodejs_22
    obsidian
    oh-my-posh 
    pnpm 
    python312 
    python312Packages.pip
    simple-scan
    spotify
    teams-for-linux
    torrent7z
    typescript
    unrar
    unzip 
    wget 
    winboat 
    wl-clipboard 
    vesktop
    vscode
  ];

  programs.java = {
    enable = true;
    package = pkgs.jdk21.override { enableJavaFX = true; };
  };
}
