{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/databases.nix
    ./modules/desktop.nix
    ./modules/dev-packages.nix
    ./modules/docker.nix
    ./modules/hardware.nix
    ./modules/home.nix
    ./modules/nvidia.nix
    ./modules/spicetify.nix
    ./modules/system.nix
    ./modules/users.nix
    ./modules/virtualisation.nix
    ./modules/brave-policies.nix
  ];

  system.stateVersion = "26.05";
}
