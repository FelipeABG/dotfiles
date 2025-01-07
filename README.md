---

# Dotfiles
This repository contains my personal configuration files for various tools and applications that I use on a daily basis. Below there is instructions on how to set up and use these configurations.

> **Note**: Arch Linux is used as an example for the installation of the tools. Adapt it to the used system.

## Overview

This repository contains configuration files for the following tools:

- **Neovim**: Text editor
- **Zsh**: Shell
- **Ghostty**: Terminal emulator
- **Tmux**: Terminal multiplexer
- **Starship**: Shell prompt

## Installation

### Clone the Repository

> **Note**: Clone this repository to your home directory:

```sh
git clone https://github.com/FelipeABG/dotfiles
cd ~/dotfiles
```

### Use GNU Stow to Manage Dotfiles

Make sure you have `stow` installed:
```
sudo pacman -S stow
```

> **Note**: Before running the `stow` command, make sure you have visited the [Tools](#tools) section and have installed the dependencies required.

To install the configurations, run the following command:

```sh
stow .
```

## Tools

### Neovim

**Configuration File**: `.config/nvim/init.vim`

- Ensure you have Neovim installed:
  ```sh
  sudo pacman -S neovim
  ```
- The next time you open Neovim, all the plugins should be installed.

### Zsh

**Configuration File**: `.zshrc`

- Ensure you have Zsh installed. If not, you can install it by following the instructions [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH).
  
- The config uses `fzf` and `zoxide` as dependencies, so make sure you have it installed: 
  ```sh
  sudo pacman -S fzf zoxide
  ```
  
- After installing, source the `.zshrc` file:
  ```sh
  source ~/.zshrc
  ```

### Ghostty

**Configuration File**: `.config/ghostty/conf`

- Ensure you have Ghostty installed. You can find installation instructions [here](https://ghostty.org/download).

### Tmux

**Configuration File**: `tmux/.tmux.conf`

- Ensure you have Tmux installed:
  ```sh
  sudo pacman -S tmux
  ```
  
- Reload the Tmux configuration by running:
  ```sh
  tmux source tmux.conf
  ```

### Starship

**Configuration File**: `.config/starship.toml`

- Ensure you have Starship installed. You can install it by running:
  ```sh
  curl -sS https://starship.rs/install.sh | sh
  ```

## Customization

Feel free to customize these configuration files. Additionally, refer to the documentation for each tool for more options and details on customization:

- [Neovim Documentation](https://neovim.io/doc/)
- [Zsh Documentation](https://zsh.sourceforge.io/Doc/)
- [Ghostty Documentation](https://ghostty.org/docs)
- [Tmux Documentation](https://github.com/tmux/tmux/wiki)
- [Starship Documentation](https://starship.rs/)


