{ config, pkgs, ... }:

{

  hardware.graphics = {
    enable = true;
    enable32Bit = true; # Steam / 32-bites appokhoz kell
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = false; # proprietary driver, nem a nyílt kernel modul
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    nvidiaSettings = true;
  };

  hardware.bluetooth.enable = true;
  
  services.blueman.enable = true;
  services.fwupd.enable = true;
  services.power-profiles-daemon.enable = true;

  hardware.steam-hardware.enable = true;
}
