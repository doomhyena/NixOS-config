{ config, lib, pkgs, ... }:

{
  virtualisation.virtualbox.host.enable = true;

  virtualisation.docker.enable = true;
  
  systemd.services.docker.wantedBy = lib.mkForce [];

  programs.gamemode.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

}   