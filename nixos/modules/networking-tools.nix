{ config, pkgs, ... }:

{
  services.openssh.enable = true;

  programs.wireshark.enable = true;

  programs.nix-ld.enable = true;

  services.locate.enable = true;

  environment.systemPackages = with pkgs; [
    nmap
    mtr
    dnsutils
  ];
}
