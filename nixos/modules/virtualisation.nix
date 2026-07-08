{ config, pkgs, ... }:

{
  virtualisation.virtualbox.host.enable = true;

  programs.gamemode.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
}
