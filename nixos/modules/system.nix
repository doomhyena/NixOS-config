{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10; # max 10 generáció a boot menüben
  boot.loader.efi.canTouchEfiVariables = true;

  boot.plymouth.enable = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Tűzfal összefoglaló - az alábbi modulok nyitnak portokat:
  #   hardware.nix - avahi openFirewall: UDP 5353 (mDNS)
  #   virtualisation.nix - steam remotePlay: UDP 27031-27036, TCP 27036
  #   virtualisation.nix - steam dedicatedServer: UDP/TCP 27015
  networking.firewall.enable = true;

  time.timeZone = "Europe/Budapest";

  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "hu_HU.UTF-8";
    LC_IDENTIFICATION = "hu_HU.UTF-8";
    LC_MEASUREMENT = "hu_HU.UTF-8";
    LC_MONETARY = "hu_HU.UTF-8";
    LC_NAME = "hu_HU.UTF-8";
    LC_NUMERIC = "hu_HU.UTF-8";
    LC_PAPER = "hu_HU.UTF-8";
    LC_TELEPHONE = "hu_HU.UTF-8";
    LC_TIME = "hu_HU.UTF-8";
  };

  console.keyMap = "hu";
  nixpkgs.config.allowUnfree = true;

  documentation.doc.enable = false;

  security.sudo.enable = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  nix.optimise.automatic = true;

  nix.settings.auto-optimise-store = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.trusted-users = [ "@wheel" ];
  nix.settings.substituters = [
    "https://cache.nixos.org/"
    "https://nix-community.cachix.org"
  ];
  nix.settings.trusted-public-keys = [
    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCUSeBw="
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.nix-ld.enable = true;

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true; # cache-eli a flake/nix shell env-eket

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  zramSwap.enable = true;

  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
    allowReboot = false;
  };
}
