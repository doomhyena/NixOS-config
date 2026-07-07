{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btop 
    brave
    canon-capt
    canon-cups-ufr2
    claude-code 
    cmatrix
    cnijfilter2
    dbeaver-bin 
    discord
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
    libreoffice 
    maven 
    nodejs_22 
    oh-my-posh 
    pnpm 
    python312 
    python312Packages.pip
    spicetify-cli 
    spotify
    teams-for-linux
    typescript 
    unzip 
    wezterm 
    wget 
    winboat 
    wl-clipboard 
    vscode

    simple-scan
  ];

  programs.java = {
    enable = true;
    package = pkgs.jdk21.override { enableJavaFX = true; };
  };
}
