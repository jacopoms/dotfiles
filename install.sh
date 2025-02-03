#!/usr/bin/env bash

# Function to check if a command exists
command_exists() {
  command -v "$1" &>/dev/null
}

# Function to install packages
install_packages() {
  if command_exists brew; then
    brew install git fzf bat eza zoxide fd tmux bash
  elif command_exists port; then
    sudo port install git fzf bat eza zoxide fd tmux bash
  else
    echo "Neither brew nor macports is installed. Please install one of them first."
    exit 1
  fi
}

# Function to create symbolic links
create_symlink() {
  local target=$1
  local link_name=$2

  if [ -e "$link_name" ] && [ ! -L "$link_name" ]; then
    ln -s "$target" "$link_name"
    echo "Created symbolic link for $(basename "$link_name")"
  else
    echo "$(basename "$link_name") is already a symbolic link or does not exist"
  fi
}

# Install necessary packages
install_packages

BASEDIR=$(dirname "$0")
cd "$BASEDIR" || exit

# HOME dotfiles
dotfiles=(bashrc bash_aliases zshrc gitignore_global gitconfig p10k.zsh tmux.conf)

if [ -n "${dotfiles[*]}" ]; then
  for file in "${dotfiles[@]}"; do
    create_symlink "${PWD}/${file}" "${HOME}/.${file}"
  done
fi

# .config directories
config_dirs=(nvim wezterm bat)
config_basedir="${HOME}/.config"

if [ -n "${config_dirs[*]}" ]; then
  for dir in "${config_dirs[@]}"; do
    create_symlink "${PWD}/${dir}" "${config_basedir}/${dir}"
  done
fi

# install tmux pluing manager
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi
