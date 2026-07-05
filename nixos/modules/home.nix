{ inputs, ... }:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.doomhyena = { lib, ... }: {
      home.stateVersion = "26.05";

      home.activation.vencordCatppuccin = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        if [[ ! -f "$HOME/.config/Vencord/settings/settings.json" ]]; then
          mkdir -p "$HOME/.config/Vencord/settings"
          echo '{"themeLinks":["https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css"]}' > "$HOME/.config/Vencord/settings/settings.json"
        fi
      '';
    };
  };
}
