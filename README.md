My dotfiles for my personal setup.

Inspired by [Dotfiles](https://missing.csail.mit.edu/2019/dotfiles)

## Features

- **Oh My Posh**: Custom prompt theme with language version display from version files
- **Antidote**: Fast, native Zsh plugin manager
- **Terminal Emulators**: Ghostty and WezTerm configurations
- **Neovim**: Modern Lua-based configuration
- **CLI Tools**: bat, eza, zoxide, fd, ripgrep, tmux, atuin

## Oh My Posh Configuration

The custom Oh My Posh theme (`omp-theme.json`) provides:
- Two-line prompt for comfortable command input
- Automatic language version detection from version files:
  - Ruby (`.ruby-version`, `tool-versions`)
  - Elixir (`.elixir-version`, `tool-versions`)
  - Node.js (`tool-versions`, `.node-version`, `.nvmrc`)
  - Python (`.python-version`, `tool-versions`)
  - Rust (`rust-toolchain`, `tool-versions`)
  - Go (`.go-version`, `tool-versions`)
- Git status with branch, ahead/behind indicators, and working tree changes
- Execution status indicator

## Zsh Plugin Manager

This configuration uses [antidote](https://antidote.sh/) as a fast, native Zsh plugin manager.

### Installation

Antidote is already installed in `~/.antidote`. The plugin configuration is defined in `.zsh_plugins.txt`.

### Updating Plugins

```bash
antidote update
```

### Adding New Plugins

Edit `.zsh_plugins.txt` and add your plugin, then restart your shell or run:

```bash
source ~/.zshrc
```
