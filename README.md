My dotfiles for my personal setup.

Inspired by [Dotfiles](https://missing.csail.mit.edu/2019/dotfiles)

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
