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

## Configuration 

The base configuration can be generated with the `nixos-generate-config --root /mnt` command.
In my file, just select the function you need, the configuration:
+ The efi and bootloader must be turned on.
+ Configure time, network, gc auto cleanup.
+ Set the default input method language.
+ Configure user permissions
+ Install plugins by default
+ Start flakes
+ Install default system packages(vim, fastfetch, v2raya, wget, curl, firefox, git, zsh).
+ Configure zsh as the default shell.
+ wechat-uos and openssl should be placed in permittedInsecurePackages.(The project provides a license for wechat-uos)

Because Nixos is not a fhs file structure, so sometimes the link dynamic library can not be found, this time you can use nix-ld to solve the problem, you can also solve the problem in the flake.

## Flakes

My flake structure includes the system configuration, development environment, additional cache servers and keys, and a few other custom modules. 
Multiple input sources are defined to deal with different situations.
In the outputs:
+ devShells: defines a development shell layer containing tools such as git, vim and nixd, and sets the EDITOR environment variable.
+ nixosConfigurations: defines a NixOS configurations for x86_64-linux systems, importing several modules, including custom configurations, Telegram search tool configurations, Home Manager configurations, and so on.
+ formatter: defines a code formatting tool, alejandra, for formatting Nix code.

## Home-manager

A range of commonly used software is installed, including terminal file managers, compression tools, network tools, text processing tools, system monitoring tools, and graphical interface applications. These software are only available to the current user and do not affect the system level configuration. It is also possible to put these programs in the modules file.

## Modules Summary

My nix config file is mainly divided into base, gui, and tui sections. 
+ `base`: contains the system's basic configuration modules, which deal with the core functionality and dependencies of the operating system.
+ `gui`: dedicated to configuring graphical user interface (GUI)-related applications and services.  
+ `tui`: focus on configuring text-based user interface (TUI) applications. Such applications typically run within the terminal and provide a richer interactive experience than the pure command line.


### Base Components

|                             | NixOS                                        | Other |
| --------------------------- | ---------------------------------------------| ----  |
|**Resource monitor**         | btop.nix                                     | [Btop][Btop]|
|**Environment Management**   | direnv.nix                                   | ---   |
|**Pip mirror**               | pip.nix                                      | ---   |
|**Media server**             | pipewire.nix                                 | ---   |
|**Usb and VM tools**         | tools.nix                                    | ---   |

### Gui components

| NixOS                       | Descriptive                                  | Other |
| --------------------------- | ---------------------------------------------| ----  |
|**creative.nix**             | Drawing and screen software, FPGA tools      |[OBS][OBS]|  
|**dev-tools.nix**            | Network, git, python dev tools               | ---   |
|**games.nix**                | Games related(Steam)                         | ---   |
|**gtk.nix**                  | Gtk ini                                      | ---   |
|**i18n.nix**                 | Input method framework                       | [fcitx5][Fcitx5]   |
|**kitty.nix**                | Termial                                      | [kitty][kitty]|
|**media.nix**                | Audio/video controller and tools             | [mpv][mpv]|
|**misc.nix**                 | Message Apps and screenshot software         | ---|
|**note-taking.nix**          | Note apps                                    | --- |
|**yazi.nix**                 | File manager                                 | [yazi][Yazi]|
|**fcitx5**                   | fcitx5 configuration                         | ---|
|**wallpaper**                | wallpaper tools                              | --- |

### Tui components

| NixOS  | Descriptive | Other |
| ----- | ------------- | ---- |
|**zellij** | Zellij configuration | [zellij][Zellij] |
|**git.nix** | Git configuration | --- |
|**note-taking** | Notebook software | --- |
|**packages.nix** | Cross-compliation chaining tools and other softwares | --- |
|**ssh.nix** | Ssh server | --- |
|**starship.nix** | Termial theme | [starship][Starship] |
|**zsh.nix** | Environment configuration | --- |

## References

+ Nix Config
    + [ryan4yin/nix-config](https://github.com/ryan4yin/nix-config)
    + [xieby1/nix_config](https://github.com/xieby1/nix_config)
    + [Emin017/flake](https://github.com/Emin017/flake)
+ Nix and flakes
    + [NixOS and Flakes](https://nixos-and-flakes.thiscute.world/zh/preface)




[Kitty]: https://github.com/kovidgoyal/kitty
[Starship]: https://github.com/starship/starship
[Btop]: https://github.com/aristocratos/btop
[mpv]: https://github.com/mpv-player/mpv
[Zellij]: https://github.com/zellij-org/zellij
[OBS]: https://obsproject.com
[Yazi]: https://github.com/sxyazi/yazi
[Fcitx5]: https://github.com/fcitx/fcitx5
