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
    ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  programs.zsh.enable = true;
}
