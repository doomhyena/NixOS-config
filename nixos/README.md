# doomhyena's NixOS configuration

NixOS 26.05, flake-alapú konfiguráció KDE Plasma 6 asztali környezettel.

## Rendszer áttekintés

| Tulajdonság | Érték |
|---|---|
| NixOS verzió | 26.05 |
| Architektúra | x86_64-linux |
| Bootloader | systemd-boot |
| Asztali környezet | KDE Plasma 6 |
| Display manager | SDDM |
| Shell | Zsh |
| Időzóna | Europe/Budapest |
| Lokalizáció | en_GB / hu_HU |

## Modulok

### `modules/system.nix`
Alaprendszer beállítások:
- Plymouth boot animáció
- NetworkManager hálózatkezelés
- Magyar billentyűzetkiosztás konzolon
- Automatikus Nix garbage collection (heti, 14 napnál régebbi generációk törlése)
- Nix store automatikus optimalizálás
- Flakes és `nix-command` engedélyezve
- `direnv` integráció
- GnuPG agent SSH támogatással
- zramSwap (swap tömörítés RAM-ban)

### `modules/hardware.nix`
Hardver konfiguráció:
- **OpenGL / graphics** — `hardware.graphics` engedélyezve 32-bites támogatással (Steam / 32-bites appokhoz)
- Bluetooth + Blueman
- fwupd (firmware frissítések)
- power-profiles-daemon (teljesítmény profilok)
- Steam hardver támogatás (kontrollerek)

### `modules/nvidia.nix`
NVIDIA GPU konfiguráció:
- Proprietary driver, modesetting engedélyezve
- `powerManagement.enable = false` (finegrained is kikapcsolva — csak Optimus PRIME-hoz kellene)
- `nvidiaSettings = true`
- `package = stable`
- `nvidia.NVreg_EnableS0ixPowerManagement=1` kernel paraméter

### `modules/desktop.nix`
Asztali környezet:
- KDE Plasma 6
- SDDM egyedi témával (`where_is_my_sddm_theme`) és `cat-vibin.png` háttérképpel
- Magyar billentyűzetkiosztás (standard variant)
- PipeWire hang (ALSA + PulseAudio kompatibilitás, 32-bites support)
- CUPS nyomtatási szolgáltatás
- GVfs és udisks2 (lemezkezelés)
- dconf
- **JetBrains Mono Nerd Font**

### `modules/users.nix`
Felhasználó: `doomhyena`
- Shell: Zsh
- Csoportok: `wheel`, `docker`, `vboxusers`
- Telepített csomag: Kate szövegszerkesztő

### `modules/home.nix`
Home-manager integráció:
- `home-manager.nixosModules.home-manager` import
- **Vencord Catppuccin Mocha** téma automatikus beállítása (`~/.config/Vencord/settings/settings.json`)

### `modules/virtualisation.nix`
- Docker (automatikus indítás bootkor)
- VirtualBox
- Steam (Remote Play és Dedicated Server tűzfal nyitva)

### `modules/databases.nix`
- PostgreSQL 16
- MariaDB (MySQL-kompatibilis)

### `modules/dev-packages.nix`
Fejlesztői eszközök és alkalmazások:

| Kategória | Csomagok |
|---|---|
| Verziókezelés | git |
| Böngésző | Brave |
| Szerkesztők / IDE | VS Code, IntelliJ IDEA CE |
| Terminal | WezTerm, btop, fastfetch, oh-my-posh |
| JVM | Java 21 (JavaFX-szel), Maven, Gradle |
| .NET | .NET SDK 8 |
| Go | Go |
| Node.js | Node.js 22, pnpm, TypeScript |
| Python | Python 3.12, pip |
| Kubernetes | kubectl, Helm, kind, k9s |
| Adatbázis GUI | DBeaver |
| Játékfejlesztés | Godot 4 |
| Kommunikáció | Discord |
| Zene | Spotify |
| Egyéb | LibreOffice, winboat, Claude Code, wget, unzip, spicetify-cli, cmatrix, flatpak, wl-clipboard |

### `modules/spicetify.nix`
Spotify testreszabás (`spicetify-nix` flake):
- Téma: **Catppuccin Mocha**
- Bővítmények: `adblock`, `hidePodcasts`, `shuffle`

## Flake inputok

| Input | Forrás |
|---|---|
| nixpkgs | `nixos-26.05` |
| home-manager | `release-26.05` |
| spicetify-nix | `github:Gerg-L/spicetify-nix` |

## Telepítés / újraépítés

```bash
sudo nixos-rebuild switch --flake /etc/nixos#nixos
```
