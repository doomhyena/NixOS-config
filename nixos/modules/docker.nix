{
  pkgs,
  username,
  ...
}:
{
  virtualisation.docker = {
    enable = true;
    extraPackages = with pkgs; [
      docker
    ];
  };

  users.users.${username}.extraGroups = [ "docker" ];
}