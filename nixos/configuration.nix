{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/system.nix
    ./modules/hardware.nix
    ./modules/desktop.nix
    ./modules/users.nix
    ./modules/virtualisation.nix
    ./modules/databases.nix
    ./modules/networking-tools.nix
    ./modules/spicetify.nix
    ./modules/dev-packages.nix
    ./modules/home.nix
    ./modules/nvidia.nix
  ];

  system.stateVersion = "26.05";
}
