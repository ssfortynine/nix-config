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

## 目录
+ [配置文件](#配置文件)
+ [Flakes 介绍](#Flakes)
+ [Home-manager 介绍](#Home-manager)
+ [Modules 介绍](#Modules)
    + [Base 部分](#Base)
    + [Gui 部分](#Gui)
    + [Tui 部分](#Tui)
+ [文件目录](#文件目录)
+ [参考](#参考)

> 该配置文件只针对于Linux版本，不确定MacOS是否适用

英文介绍在[README_zn][README_zn]

## :information_source: 配置文件

基本配置可以使用 `nixos-generate-config --root /mnt` 命令生成。在文件中，只需选择需要的功能和配置：
+ 必须打开 efi 和引导加载器。
+ 配置时间、网络、GC 自动清理。
+ 设置默认输入法语言。
+ 配置用户权限
+ 默认安装插件
+ 启动flake
+ 安装默认系统包（vim、fastfetch、v2raya、wget、curl、firefox、git、zsh）。
+ 将 zsh 配置为默认 shell。
+ wechat-uos 和 openssl 应放在 permittedInsecurePackages 中。

因为 Nixos 不是 fhs 文件结构，所以有时会找不到链接动态链接库，这时可以使用 nix-ld 来解决问题，也可以在 flake 中解决问题。

## :page_facing_up: Flakes 介绍

我的 flake 结构包括系统配置、开发环境、额外的缓存服务器和密钥，以及其他一些自定义模块。为了应对不同的情况，定义了多个输入源。在输出中:

+ devShells：定义开发 shell 层，包含 git、vim 和 nixd 等工具，并设置 EDITOR 环境变量。
+ nixosConfigurations：定义 x86_64-linux 系统的 NixOS 配置，导入多个模块，包括自定义配置、Telegram 搜索工具配置、家庭管理器配置等。
+ formatter：定义了一个代码格式化工具 alejandra，用于格式化 Nix 代码。

## :page_facing_up: Home-manager 介绍

系统安装了一系列常用软件，包括终端文件管理器、压缩工具、网络工具、文本处理工具、系统监控工具和图形界面应用程序。这些软件仅供当前用户使用，不会影响系统级配置。也可以将这些程序放在模块文件中。

## :cd: Modules 介绍

nix 配置文件主要分为 base、gui 和 tui 三部分。
+ `base`：包含系统的基本配置模块，处理操作系统的核心功能和依赖关系。
+ `gui`：专门用于配置与图形用户界面（GUI）相关的应用程序和服务。 
+ `tui`: 侧重于配置基于文本的用户界面（TUI）应用程序。此类应用程序通常在终端内运行，提供更丰富的交互体验。

### :o: Base 部分
|                             | NixOS                                       | 其他  |
| --------------------------- | --------------------------------------------| ----  |
|**资源监视器**             | btop.nix                                      | [Btop][Btop]|
|**环境管理**               | direnv.nix                                    | ---   |
|**媒体服务**               | pipewire.nix                                  | ---   |
|**USB和VM的相关server**    | tools.nix                                     | ---   |

### :o: Gui 部分

| NixOS                       | 内容                                        | 其他  |
| --------------------------- | --------------------------------------------| ----  |
|**creative.nix**             | 绘图和屏幕软件、FPGA 工具                   | [OBS][OBS]|  
|**dev-tools.nix**            | 网络、git、python 开发工具                  | ---   |
|**games.nix**                | 游戏相关(Steam)                             | ---   |
|**gtk.nix**                  | Gtk 配置                                    | ---   |
|**i18n.nix**                 | 输入法框架                                  | [fcitx5][Fcitx5]   |
|**kitty.nix**                | 终端配置                                    | [kitty][kitty]|
|**media.nix**                | 音频/视频控制器和工具                       | [mpv][mpv]|
|**misc.nix**                 | 信息应用程序和截图软件                      | ---   |
|**note-taking.nix**          | 笔记软件                                    | ---   |
|**yazi.nix**                 | 文件管理器                                  | [yazi][Yazi]|
|**fcitx5**                   | fcitx5 配置                                 | ---   |
|**wallpaper**                | 壁纸工具                                    | ---   |

### :o: Tui 部分

| NixOS  | 内容 | 其他 |
| ----- | ------------- | ---- |
|**zellij** | Zellij 配置 | [zellij][Zellij] |
|**git.nix** | Git 配置 | --- |
|**packages.nix** | 交叉编译链工具或者其他软件包| --- |
|**ssh.nix** | Ssh 相关 | --- |
|**starship.nix** | 终端主题 | [starship][Starship] |
|**zsh.nix** | Zsh和环境变量配置 | --- |


## :card_index: 文件目录
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
│   │   ├── direnv.nix
│   │   ├── pipewire.nix
│   │   └── tools.nix
│   ├── base.nix
│   ├── gui
│   │   ├── creative.nix
│   │   ├── desktop
│   │   │   ├── fhs.nix
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
│   │   └── yazi.nix
│   ├── gui.nix
│   ├── tui
│   │   ├── git.nix
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
## :books: 参考

+ Nix 配置
    + [ryan4yin/nix-config](https://github.com/ryan4yin/nix-config)
    + [xieby1/nix_config](https://github.com/xieby1/nix_config)
    + [Emin017/flake](https://github.com/Emin017/flake)
+ NixOS 与 flakes
    + [NixOS and Flakes](https://nixos-and-flakes.thiscute.world/zh/preface)




[Kitty]: https://github.com/kovidgoyal/kitty
[Starship]: https://github.com/starship/starship
[Btop]: https://github.com/aristocratos/btop
[mpv]: https://github.com/mpv-player/mpv
[Zellij]: https://github.com/zellij-org/zellij
[OBS]: https://obsproject.com
[Yazi]: https://github.com/sxyazi/yazi
[Fcitx5]: https://github.com/fcitx/fcitx5
[ryan4yin/nix-config]: https://github.com/ryan4yin/nix-config
[README_zn]: https://github.com/ssfortynine/nix-config/blob/main/README_zn.md

