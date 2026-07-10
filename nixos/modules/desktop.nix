{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;

  services.xserver.xkb = {
    layout = "hu";
    variant = "standard";
  };

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.flatpak.enable = true;

  services.gvfs.enable = true;

  services.udisks2.enable = true;

  programs.dconf.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
