{ config, pkgs, ... }:

{

  hardware.graphics = {
    enable = true;
    enable32Bit = true; # Steam / 32-bites appokhoz kell
  };

  hardware.bluetooth.enable = true;

  services.blueman.enable = true;
  services.fwupd.enable = true;
  services.power-profiles-daemon.enable = true;

  hardware.steam-hardware.enable = true;
}
