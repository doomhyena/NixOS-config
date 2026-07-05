{ config, pkgs, ... }:

{
  programs.nix-ld.enable = true;

  services.locate.enable = true;
}
