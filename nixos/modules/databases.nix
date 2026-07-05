{ config, pkgs, ... }:

{
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16;
  };

  services.mysql = {
    enable = true;
    package = pkgs.mariadb; # MySQL-kompatibilis, ez a NixOS-standard
  };
}
