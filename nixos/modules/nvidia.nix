{ config, ... }:

{
  boot.extraModprobeConfig = ''
    options nvidia_modeset vblank_sem_control=0
    options nvidia NVreg_PreserveVideoMemoryAllocations=1 NVreg_TemporaryFilePath=/var/tmp
  '';
  boot.kernelModules = [ "nvidia_uvm" "nvidia_modeset" "nvidia_drm" "nvidia" ];
  boot.kernelParams = [
    "nvidia-drm.modeset=1"
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
    "nvidia.NVreg_TemporaryFilePath=/var/tmp"
  ];

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;

    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}