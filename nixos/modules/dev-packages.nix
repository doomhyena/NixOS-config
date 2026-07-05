{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    gh
    wget
    unzip
    brave
    vscode
    jetbrains.idea-oss
    oh-my-posh
    fastfetch
    wezterm
    dotnet-sdk_8
    go
    maven
    gradle
    nodejs_22
    pnpm
    typescript
    python312
    python312Packages.pip
    kubectl
    kubernetes-helm
    kind
    k9s
    godot_4
    dbeaver-bin
    postman
    discord
    spicetify-cli
    winboat
    libreoffice
    claude-code
    spotify
  ];

  programs.java = {
    enable = true;
    package = pkgs.jdk21.override { enableJavaFX = true; };
  };
}
