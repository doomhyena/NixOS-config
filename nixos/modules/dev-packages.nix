{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btop 
    brave
    canon-cups-ufr2
    claude-code 
    cmatrix
    cnijfilter2
    docker-compose
    dbeaver-bin
    dotnet-sdk_8 
    fastfetch
    flatpak
    git 
    godot_4 
    go gradle 
    jetbrains.idea-oss 
    k9s
    kubectl
    kubernetes-helm
    kind
    lazydocker
    libreoffice
    mangohud
    maven 
    netflix
    nodejs_22
    obsidian
    oh-my-posh 
    pnpm 
    python312 
    python312Packages.pip
    simple-scan
    spotify
    teams-for-linux
    typescript
    unrar
    unzip 
    wezterm 
    wget 
    winboat 
    wl-clipboard 
    vesktop
    vscode
    kdePackages.isoimagewriter
  ];

  programs.java = {
    enable = true;
    package = pkgs.jdk21.override { enableJavaFX = true; };
  };
}
