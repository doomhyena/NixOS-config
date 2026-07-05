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
├── assets/
├── dotfiles/
│   ├── fastfetch/             # fastfetch config (config.jsonc)
│   ├── oh-my-posh/            # oh-my-posh theme config
│   └── zsh/                   # .zshrc and related config
├── modules/
│   ├── databases.nix          # PostgreSQL, MariaDB
│   ├── desktop.nix            # Plasma6, SDDM, PipeWire, fonts
│   ├── dev-packages.nix       # dev tools and languages
│   ├── hardware.nix           # NVIDIA, bluetooth, power management
│   ├── networking-tools.nix   # SSH, wireshark, networking tools
│   ├── system.nix             # boot, locale, nix settings
│   ├── users.nix              # user account definition(s)
│   └── virtualisation.nix     # Docker, VirtualBox, Steam
├── configuration.nix
├── hardware-configuration.nix
├── flake.nix
└── flake.lock
```

## What's included

**Desktop environment**
- KDE Plasma 6 on Wayland, custom SDDM theme with a custom background image
- PipeWire audio (instead of PulseAudio), Hungarian keyboard layout
- JetBrains Mono Nerd Font

**Shell**
- zsh with a custom config (`dotfiles/zsh/`)
- oh-my-posh prompt with the Catppuccin theme (`dotfiles/oh-my-posh/`)
- fastfetch config for terminal system info (`dotfiles/fastfetch/`)

**Dev tools**
- .NET 8 SDK, Go, Java 21 (with JavaFX) + Maven/Gradle
- Node.js 22, pnpm, TypeScript
- Python 3.12
- Kubernetes: kubectl, helm, kind, k9s
- Godot 4
- Editors: VS Code, IntelliJ IDEA (Community), Kate
- DBeaver, Postman, GitHub CLI

**Databases**
- PostgreSQL 16
- MariaDB (MySQL-compatible)

**Virtualisation / Gaming**
- Docker (enabled on boot)
- VirtualBox
- Steam (with Remote Play + dedicated server ports)

**Networking**
- OpenSSH, Wireshark, nmap, mtr, dnsutils
- NetworkManager

**System**
- systemd-boot + Plymouth boot splash
- Automatic GC (weekly, deletes generations older than 14 days)
- Flakes + nix-command enabled
- zram swap

## Known issues
- **In progress:** NVIDIA suspend/resume hard freeze — the machine freezes on wake, currently tuning kernel power management parameters to fix it.

## Usage

```bash
sudo nixos-rebuild switch --flake .#nixos
```

## About me

I put this config together mostly on my own, while finishing the Informatikai rendszer-
és alkalmazás-üzemeltető technikus program at Bláthy Ottó Titusz Informatikai Technikum.
I'm currently preparing to apply to Óbudai Egyetem NIK's Mérnökinformatikus program.

---

*Feedback, ideas, and PRs are welcome — I'm still learning NixOS, so if something could
be done better, feel free to let me know!*