<p align="center">
  <img width="100px" src="./images/logo.png" align="center" alt="GitHub Readme Stats" />
  <h2 align="center">ssfortynine's Nix Config</h2>
  <p align="center">
    <img alt="Static Badge" src="https://img.shields.io/badge/Nixos-24.05-blue">
    <img alt="Static Badge" src="https://img.shields.io/badge/nix%20flakes-learning-ff66ff">
    <img src="https://img.shields.io/github/issues/ssfortynine/nix-config" />
    <img src="https://img.shields.io/github/forks/ssfortynine/nix-config" />
    <img src="https://img.shields.io/github/stars/ssfortynine/nix-config" />
   </p>
</p>


## Directory Tree
```bash
.
├── configuration.nix
├── flake.lock
├── flake.nix
├── hardware-configuration.nix
├── home.nix
├── lib
│   └── default.nix
├── license.tar.gz
├── modules
│   ├── base
│   │   ├── btop.nix
│   │   ├── container.nix
│   │   ├── direnv.nix
│   │   ├── pipewire.nix
│   │   ├── pip.nix
│   │   ├── shell.nix
│   │   └── tools.nix
│   ├── base.nix
│   ├── gui
│   │   ├── creative.nix
│   │   ├── desktop
│   │   │   ├── fhs.nix
│   │   │   └── remote-desktop
│   │   │       ├── sunshine.nix
│   │   │       └── tailscale.nix
│   │   ├── dev-tools.nix
│   │   ├── fcitx5
│   │   │   ├── classicui.conf
│   │   │   ├── default.nix
│   │   │   └── profile
│   │   ├── games.nix
│   │   ├── gtk.nix
│   │   ├── i18n.nix
│   │   ├── kitty.nix
│   │   ├── media.nix
│   │   ├── misc.nix
│   │   ├── note-taking.nix
│   │   ├── wallpaper
│   │   │   ├── default.nix
│   │   │   └── wallpaper-switcher.py
│   │   ├── xdg.nix
│   │   └── yazi.nix
│   ├── gui.nix
│   ├── tui
│   │   ├── git.nix
│   │   ├── note-taking.nix
│   │   ├── packages.nix
│   │   ├── ssh.nix
│   │   ├── starship.nix
│   │   ├── zellij
│   │   │   ├── config.kdl
│   │   │   ├── default.nix
│   │   │   └── README.md
│   │   └── zsh.nix
│   └── tui.nix
└── README.md

```
## Summary

My nix config file is mainly divided into base, gui, and tui sections. 
+ `base`: contains the system's basic configuration modules, which deal with the core functionality and dependencies of the operating system.
+ `gui`: dedicated to configuring graphical user interface (GUI)-related applications and services.  
+ `tui`: focus on configuring text-based user interface (TUI) applications. Such applications typically run within the terminal and provide a richer interactive experience than the pure command line.

### Base Components

|                             | NixOS                                                                                                               |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------- |
|**Resource monitor**         | [Btop][Btop]|
|

