# Doomhyena's NixOS config

Personal NixOS flake configuration for my daily work + gaming + university prep machine.
Built modularly to keep things maintainable and easy to extend.

## Hardware

- **Machine:** Lenovo LOQ
- **CPU:** AMD Ryzen 5
- **GPU:** NVIDIA RTX 3050 (proprietary driver)
- **DE:** KDE Plasma 6 (Wayland), with SDDM display manager
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
    │   └── cat-vibin.png      # SDDM login background
    ├── modules/
    │   ├── databases.nix          # PostgreSQL, MariaDB
    │   ├── desktop.nix            # Plasma6, SDDM, PipeWire, fonts, printing
    │   ├── dev-packages.nix       # dev tools and languages
    │   ├── hardware.nix           # NVIDIA, bluetooth, power management, fwupd
    │   ├── networking-tools.nix   # nix-ld, locate
    │   ├── spicetify.nix          # Spotify customization via spicetify-nix
    │   ├── system.nix             # boot, locale, nix settings, direnv, gpg
    │   ├── users.nix              # user account definition(s)
    │   └── virtualisation.nix     # Docker, VirtualBox, Steam
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
- KDE Plasma 6 on Wayland, custom SDDM theme (`where-is-my-sddm-theme`) with a custom background image
- PipeWire audio (instead of PulseAudio), Hungarian keyboard layout
- CUPS printing support
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
- Editors: VS Code, IntelliJ IDEA (Community), Kate, WezTerm
- DBeaver, Postman, GitHub CLI
- direnv (automatic dev shell activation)
- GnuPG agent with SSH support
- nix-ld (run unpatched dynamic binaries)
- locate (file search daemon)
- Claude Code

**Music**
- Spotify with Spicetify (Catppuccin Mocha theme, adblock, hide podcasts, shuffle extensions)

**Databases**
- PostgreSQL 16
- MariaDB (MySQL-compatible)

**Virtualisation / Gaming**
- Docker (enabled on boot)
- VirtualBox
- Steam (with Remote Play + dedicated server ports, Steam hardware/controller support)

**Apps**
- Brave browser
- Discord
- LibreOffice
- winboat
- btop

**System**
- systemd-boot + Plymouth boot splash
- Automatic GC (weekly, deletes generations older than 14 days)
- Nix store auto-optimisation
- Flakes + nix-command enabled
- zram swap
- fwupd (firmware updates via LVFS)
- power-profiles-daemon (performance / balanced / power-saver profiles)

## NVIDIA notes

The NVIDIA suspend/resume hard freeze is **fixed**. The solution:

```nix
hardware.nvidia.powerManagement.enable = true;  # enables nvidia-suspend/resume/hibernate systemd services

boot.kernelParams = [
  "nvidia.NVreg_EnableS0ixPowerManagement=1"
];
```

`NVreg_EnableS0ixPowerManagement=1` enables modern S0ix (s2idle) power management for the NVIDIA driver, which prevents the GPU from hanging on wake.

## Usage

```bash
sudo nixos-rebuild switch --flake .#nixos
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
