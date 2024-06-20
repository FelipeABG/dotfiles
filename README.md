# Dotfiles

Welcome to my dotfiles repository! This repository contains my personal configuration files for various tools and applications that I use on a daily basis. Below you will find instructions on how to set up and use these configurations.

> **Note**: Arch linux is used as example for installation of the tools. Adapt it to you own sytem.

## Table of Contents

- [Overview](#overview)
- [Tools](#tools)
  - [Neovim](#neovim)
  - [Zsh](#zsh)
  - [Alacritty](#alacritty)
  - [Tmux](#tmux)
  - [Starship](#starship)
- [Customization](#customization)
- [Credits](#credits)

## Overview

This repository contains configuration files for the following tools:

- **Neovim**: A highly configurable text editor.
- **Zsh**: A powerful shell with many features.
- **Alacritty**: A fast, cross-platform terminal emulator.
- **Tmux**: A terminal multiplexer that allows you to manage multiple terminal sessions.
- **Starship**: A customizable, minimal, and fast shell prompt.

## Tools

### Neovim

Make sure you have neovim installed:
```
sudo pacman -S neovim
```

**Configuration File**: `nvim/init.vim`

- My Neovim configuration includes various plugins managed by a plugin manager ([Lazy](https://github.com/folke/lazy.nvim)).

The next time you open neovim, all the plugins should be installed.

### Zsh

**Configuration File**: `.zshrc`

- Make sure you have zsh installed. If not, you can install it in your operating system following the instructions [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH).

- fzf is used in the configuration, so make sure you have it installed as well. If not:
```
sudo pacman -S fzf
```

- zoxide is used in the configuration, so make sure you have it installed as well. If not:
```
sudo pacman -S zoxide
```

After that, just source the config file by running `source .zshrc`.

### Alacritty

**Configuration File**: `alacritty/alacritty.toml`

- Ensure you have Alacritty installed. You can find installation instructions [here](https://github.com/alacritty/alacritty).

### Tmux

**Configuration File**: `.tmux.conf`

- After placing the `.tmux.conf` file in your home directory, reload the Tmux configuration by running:
  ```sh
  tmux source-file ~/.tmux.conf
  ```

### Starship

**Configuration File**: `starship/starship.toml`

- Ensure you have Starship installed. You can install it by running:
  ```sh
  curl -sS https://starship.rs/install.sh | sh
  ```

## Customization

Feel free to customize these configuration files to suit your needs. Each file is well-commented to help you understand what each setting does. Additionally, you can refer to the documentation for each tool for more options and details on customization:

- [Neovim Documentation](https://neovim.io/doc/)
- [Zsh Documentation](https://zsh.sourceforge.io/Doc/)
- [Alacritty Documentation](https://github.com/alacritty/alacritty/blob/master/README.md)
- [Tmux Documentation](https://github.com/tmux/tmux/wiki)
- [Starship Documentation](https://starship.rs/)

## Credits

Many of the configurations and ideas in these dotfiles were inspired by other developers and various online resources. Special thanks to the open-source community for sharing their setups and tips.


