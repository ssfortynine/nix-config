<div align="center">
  <h1>ssfortynine's Nix Config</h1>
  
  <p>
    <img alt="NixOS Version" src="https://img.shields.io/badge/NixOS-25.11-blue?logo=nixos&logoColor=white&style=flat-square">
    <img alt="Nix Flakes" src="https://img.shields.io/badge/Nix_Flakes-Enabled-ff66ff?logo=nix&logoColor=white&style=flat-square">
    <img alt="Repo Size" src="https://img.shields.io/github/repo-size/ssfortynine/nix-config?style=flat-square">
    <br/>
    <img alt="Issues" src="https://img.shields.io/github/issues/ssfortynine/nix-config?style=flat-square&color=orange" />
    <img alt="Forks" src="https://img.shields.io/github/forks/ssfortynine/nix-config?style=flat-square&color=orange" />
    <img alt="Stars" src="https://img.shields.io/github/stars/ssfortynine/nix-config?style=flat-square&color=orange" />
  </p>

  <p>
    A reproducible, modular, and declarative NixOS configuration based on Flakes & Home Manager.
  </p>

  <p>
    <a href="#-english"><strong>🇺🇸 English</strong></a> | <a href="#-中文"><strong>🇨🇳 中文</strong></a>
  </p>
</div>

---

<a name="-english"></a>
## 🇺🇸 English

### 📖 Introduction
This repository hosts my personal **NixOS** configuration. It leverages **Nix Flakes** for reproducibility and **Home Manager** for user-environment management. The structure is highly modular, separated into Base system, GUI, and TUI components.

### ✨ Key Features

*   **❄️ Flake-based**: Uses `flake.nix` to pin dependencies and manage output schemas (`nixosConfigurations`, `devShells`, `formatter`).
*   **🏠 Home Manager**: Manages user-specific dotfiles and packages (zsh, git, theme, etc.) separately from the system.
*   **🛠️ Developer Ready**: Includes a `devShell` with `git`, `vim`, and `nixd` pre-configured.
*   **📦 FHS Compatibility**: Solves dynamic linking issues for non-Nix binaries using `nix-ld`.
*   **🔧 Core Setup**:
    *   Automated UEFI & Bootloader configuration.
    *   System maintenance (Auto GC, Timezone, Network).
    *   ZSH as the default shell.
    *   Pre-configured insecure packages management (e.g., `wechat-uos`, `openssl`).

### 🧩 Modules Overview

The configuration is strictly divided into three layers: `base`, `gui`, and `tui`.

#### 1. Base Components (`/modules/base`)
*Core system functionality and essential dependencies.*

| Module | Description | Tool Reference |
| :--- | :--- | :--- |
| **btop.nix** | Resource monitoring | [Btop][Btop] |
| **direnv.nix** | Per-directory environment loader | - |
| **pipewire.nix** | Audio & Video server | - |
| **tools.nix** | USB utilities & Virtualization tools | - |

#### 2. GUI Components (`/modules/gui`)
*Desktop environment, graphical apps, and ricing.*

| Module | Description | Tool Reference |
| :--- | :--- | :--- |
| **creative.nix** | Drawing, FPGA tools, Streaming | [OBS][OBS] |
| **kitty.nix** | GPU-accelerated terminal emulator | [Kitty][Kitty] |
| **i18n.nix** | Input method framework | [Fcitx5][Fcitx5] |
| **media.nix** | Video/Audio players | [mpv][mpv] |
| **yazi.nix** | Terminal file manager (Image preview support) | [Yazi][Yazi] |
| **desktop/** | FHS environments & Remote Desktop (Sunshine/Tailscale) | - |

#### 3. TUI Components (`/modules/tui`)
*Terminal-based workflows and CLI tools.*

| Module | Description | Tool Reference |
| :--- | :--- | :--- |
| **zellij** | Terminal workspace/multiplexer | [Zellij][Zellij] |
| **starship.nix** | Customizable prompt for any shell | [Starship][Starship] |
| **ssh.nix** | SSH server configuration | - |
| **git.nix** | Git configuration & aliases | - |

---

<a name="-中文"></a>
## 🇨🇳 中文

### 📖 简介
这是我个人的 **NixOS** 配置文件仓库。采用了 **Nix Flakes** 保证构建的可复现性，并使用 **Home Manager** 来管理用户级的软件和配置。整体架构高度模块化，清晰地划分为基础系统 (Base)、图形界面 (GUI) 和终端界面 (TUI) 三大部分。

### ✨ 主要特性

*   **❄️ 基于 Flakes**: 使用 `flake.nix` 锁定依赖，统一管理系统配置 (`nixosConfigurations`)、开发环境 (`devShells`) 和格式化工具。
*   **🏠 Home Manager**: 将用户软件（如 zsh, git, 主题等）与系统级配置分离管理。
*   **🛠️ 开箱即用的开发环境**: 提供了包含 `git`, `vim`, `nixd` 等工具的 Shell 环境。
*   **📦 FHS 兼容性**: 针对 NixOS 非 FHS 文件结构导致的动态链接库缺失问题，集成了 `nix-ld` 解决方案。
*   **🔧 核心配置**:
    *   自动配置 UEFI 和 Bootloader。
    *   自动化的垃圾回收 (GC)、时区与网络配置。
    *   默认使用 ZSH 作为 Shell。
    *   内置不安全包许可管理（如 `wechat-uos`, `openssl`，已包含 License 处理）。

### 🧩 模块概览

配置逻辑主要分为三层：`base` (基础), `gui` (图形), `tui` (终端)。

#### 1. 基础组件 (`/modules/base`)
*操作系统核心功能与底层依赖。*

| 模块 | 描述 | 相关工具 |
| :--- | :--- | :--- |
| **btop.nix** | 系统资源监控 | [Btop][Btop] |
| **direnv.nix** | 目录环境自动加载工具 | - |
| **pipewire.nix** | 现代音视频服务 | - |
| **tools.nix** | USB 工具与虚拟化支持 | - |

#### 2. GUI 组件 (`/modules/gui`)
*桌面环境、图形应用与界面美化。*

| 模块 | 描述 | 相关工具 |
| :--- | :--- | :--- |
| **creative.nix** | 绘图软件, FPGA 工具, 推流录屏 | [OBS][OBS] |
| **kitty.nix** | 终端模拟器配置 | [Kitty][Kitty] |
| **i18n.nix** | 输入法框架 (fcitx5) | [Fcitx5][Fcitx5] |
| **media.nix** | 影音播放器与控制工具 | [mpv][mpv] |
| **yazi.nix** | 终端文件管理器 (支持图像预览) | [Yazi][Yazi] |
| **desktop/** | FHS 环境模拟与远程桌面 (Sunshine/Tailscale) | - |

#### 3. TUI 组件 (`/modules/tui`)
*命令行工具与终端工作流。*

| 模块 | 描述 | 相关工具 |
| :--- | :--- | :--- |
| **zellij** | 终端复用器/工作区管理 | [Zellij][Zellij] |
| **starship.nix** | 跨 Shell 的提示符主题 | [Starship][Starship] |
| **ssh.nix** | SSH 服务端配置 | - |
| **git.nix** | Git 全局配置与别名 | - |

---

## 📚 References / 致谢

This configuration is inspired by several excellent community projects:
本配置参考了以下优秀的开源项目：

+ **Nix Config Templates**:
    + [ryan4yin/nix-config](https://github.com/ryan4yin/nix-config)
    + [xieby1/nix_config](https://github.com/xieby1/nix_config)
    + [Emin017/flake](https://github.com/Emin017/flake)
+ **Documentation**:
    + [NixOS and Flakes Book](https://nixos-and-flakes.thiscute.world/zh/preface)

<!-- Links -->
[Kitty]: https://github.com/kovidgoyal/kitty
[Starship]: https://github.com/starship/starship
[Btop]: https://github.com/aristocratos/btop
[mpv]: https://github.com/mpv-player/mpv
[Zellij]: https://github.com/zellij-org/zellij
[OBS]: https://obsproject.com
[Yazi]: https://github.com/sxyazi/yazi
[Fcitx5]: https://github.com/fcitx/fcitx5
