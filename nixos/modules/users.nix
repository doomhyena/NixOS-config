{ config, pkgs, ... }:

{
  users.users.doomhyena = {
    isNormalUser = true;
    description = "Csontos Kincső Anasztázia";
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "docker"
      "vboxusers"
      "scanner"
      "lp"
    ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  programs.zsh.enable = true;
}
