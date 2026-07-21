# Doomhyena's NixOS config

Personal NixOS flake configuration for my daily work + gaming + university prep machine.
Built modularly to keep things maintainable and easy to extend.

## Hardware

- **Machine:** Lenovo LOQ
- **CPU:** AMD Ryzen 5
- **GPU:** NVIDIA RTX 3050 (proprietary driver)
- **DE:** COSMIC Desktop (Wayland)
- **Shell:** zsh + oh-my-posh (Catppuccin theme)

## Structure

```
.
├── dotfiles/
│   ├── fastfetch/             # fastfetch config (config.jsonc)
│   ├── OhMyPosh/              # oh-my-posh theme config
│   └── Zsh/                   # .zshrc and related config
└── nixos/
    ├── assets/
    │   └── cat-vibin.png      # login background
    ├── modules/
    │   ├── databases.nix          # PostgreSQL, MariaDB
    │   ├── desktop.nix            # COSMIC Desktop, PipeWire, Flatpak, fonts, printing
    │   ├── dev-packages.nix       # dev tools, languages, apps
    │   ├── docker.nix             # Docker daemon
    │   ├── hardware.nix           # bluetooth, scanner, avahi, power management, fwupd
    │   ├── home.nix               # Home Manager (git config, Vencord theme)
    │   ├── nvidia.nix             # NVIDIA driver and power management
    │   ├── spicetify.nix          # Spotify customization via spicetify-nix
    │   ├── system.nix             # boot, locale, nix settings, direnv, gpg, nix-ld
    │   ├── users.nix              # user account definition(s)
    │   └── virtualisation.nix     # VirtualBox, Steam, GameMode
    ├── configuration.nix
    ├── hardware-configuration.nix
    ├── flake.nix
    └── flake.lock
```

## Flake inputs

- `nixpkgs` - NixOS 26.05
- `home-manager` - release-26.05
- `spicetify-nix` - Spotify client customization

## What's included

**Desktop environment**
- COSMIC Desktop on Wayland
- PipeWire audio (instead of PulseAudio), Hungarian keyboard layout
- CUPS printing support (with Canon UFR2 and CNIJFilter2 drivers)
- Flatpak + xdg-desktop-portal-gtk
- gvfs + udisks2 for file manager integration and disk management
- JetBrains Mono Nerd Font

**Shell**
- zsh with a custom config (`dotfiles/Zsh/`)
- oh-my-posh prompt with the Catppuccin theme (`dotfiles/OhMyPosh/`)
- fastfetch config for terminal system info (`dotfiles/fastfetch/`)

**Dev tools**
- .NET 8 SDK, Go, Java 21 (with JavaFX) + Maven/Gradle
- Node.js 22, pnpm, TypeScript
- Python 3.12 + pip
- Kubernetes: kubectl, helm, kind, k9s
- Godot 4
- Editors: VS Code, IntelliJ IDEA (Community), WezTerm
- DBeaver, GitHub CLI (git)
- Docker + docker-compose + lazydocker
- direnv (automatic dev shell activation)
- GnuPG agent with SSH support
- nix-ld (run unpatched dynamic binaries)
- Claude Code

**Music**
- Spotify with Spicetify (Catppuccin Mocha theme, adblock, hide podcasts, shuffle extensions)

**Databases**
- PostgreSQL 16
- MariaDB (MySQL-compatible)

**Virtualisation / Gaming**
- Docker (enabled on boot, separate `docker.nix`)
- VirtualBox
- Steam (with Remote Play + dedicated server ports, Steam hardware/controller support)
- GameMode (CPU/GPU performance boost while gaming)
- MangoHUD (in-game overlay: FPS, temps, GPU usage)

**Apps**
- Brave browser
- Vesktop (Discord with Vencord — Catppuccin Mocha theme auto-configured)
- LibreOffice
- Obsidian (note-taking)
- Netflix
- Teams for Linux
- winboat
- btop
- simple-scan (scanner UI)
- unrar, cmatrix

**Home Manager**
- Git configured with name, email, and useful aliases (`co`, `st`, `br`, `lg`)
- Vencord `settings.json` auto-bootstrapped with the Catppuccin Mocha Discord theme

**System**
- systemd-boot + Plymouth boot splash (max 10 generations in boot menu)
- Automatic GC (weekly, deletes generations older than 14 days)
- Nix store auto-optimisation
- Flakes + nix-command enabled
- Binary caches: `cache.nixos.org` + `nix-community.cachix.org`
- Automatic weekly NixOS upgrade (no auto-reboot)
- zram swap
- fwupd (firmware updates via LVFS)
- fstrim (periodic SSD TRIM)
- power-profiles-daemon (performance / balanced / power-saver profiles)
- `NIXOS_OZONE_WL=1` set system-wide for Electron/Chromium Wayland support

**Hardware**
- SANE scanner support (`sane-airscan` for driverless network/USB scanners)
- ipp-usb (IPP-over-USB printing/scanning)
- Avahi (mDNS / network service discovery, firewall UDP 5353 open)
- Bluetooth + Blueman

## NVIDIA notes

The NVIDIA suspend/resume hard freeze is **not fixed**.

## Usage

```bash
git -C /etc/nixos add -A
sudo nixos-rebuild switch -flake .
```

Run from inside the `nixos/` directory, or pass the full path:

```bash
sudo nixos-rebuild switch --flake /path/to/NixOS-config/nixos#nixos
```

## About me

I put this config together mostly on my own, while finishing the Informatikai rendszer-
és alkalmazás-üzemeltető technikus program at Bláthy Ottó Titusz Informatikai Technikum.
I'm currently preparing to apply to Óbudai Egyetem NIK's Mérnökinformatikus program.

---

*Feedback, ideas, and PRs are welcome - I'm still learning NixOS, so if something could
be done better, feel free to let me know!*