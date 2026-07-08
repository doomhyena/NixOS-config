{ config, pkgs, ... }:

let
  sddmBackground = pkgs.stdenvNoCC.mkDerivation {
    name = "cat-vibin.png";
    src = ./../assets/cat-vibin.png;
    dontUnpack = true;
    installPhase = "cp $src $out";
  };

  customSddmTheme = pkgs.where-is-my-sddm-theme.override {
    themeConfig.General = {
      background = "${sddmBackground}";
      backgroundMode = "fill";
    };
  };
in
{
  services.xserver.enable = true;

  services.desktopManager.plasma6.enable = true;

  services.displayManager.sddm = {
    enable = true;
    theme = "where_is_my_sddm_theme";
    extraPackages = [ customSddmTheme ];
  };

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

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  services.gvfs.enable = true;

  services.udisks2.enable = true;

  programs.dconf.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  environment.systemPackages = [
    customSddmTheme
  ];
}
