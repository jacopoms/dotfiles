#!/usr/bin/env bash

# Function to check if a command exists
command_exists() {
  command -v "$1" &>/dev/null
}

# Function to install packages
install_packages() {
  if command_exists brew; then
    brew install git fzf bat eza zoxide fd rg tmux bash neovim asdf starship wezterm ghostty atuin git-delta oh-my-posh ollama
    # Maccy provides system clipboard history (menu bar app, no CLI/tmux-fzf integration)
    brew install --cask maccy
  elif command_exists port; then
    sudo port install git fzf bat eza zoxide fd rg tmux bash neovim asdf starship ghostty atuin git-delta oh-my-posh ollama
  else
    echo "Neither brew nor macports is installed. Please install one of them first."
    exit 1
  fi
}

# Function to create symbolic links (idempotent: replaces existing symlinks,
# skips real files/dirs so user data is never overwritten)
create_symlink() {
  local target=$1
  local link_name=$2

  mkdir -p "$(dirname "$link_name")"

  if [ -L "$link_name" ]; then
    rm "$link_name"
  elif [ -e "$link_name" ]; then
    echo "Skipping $(basename "$link_name"): $link_name exists and is not a symlink"
    return 0
  fi

  ln -s "$target" "$link_name"
  echo "Created symbolic link for $(basename "$link_name")"
}

# Install necessary packages
install_packages

# opencode uses local models via ollama (see opencode/opencode.jsonc) — make sure it's available
if ! command_exists ollama; then
  echo "Warning: ollama is not installed. opencode's local models will not work."
  echo "Install it with 'brew install ollama' or 'sudo port install ollama'."
fi

BASEDIR=$(dirname "$0")
cd "$BASEDIR" || exit

# HOME dotfiles
dotfiles=(bashrc bash_aliases zshrc gitignore_global gitconfig p10k.zsh tmux.conf tool-versions zsh_plugins.txt myjan.omp.json myjan-onelight.omp.json theme.zsh)

if [ -n "${dotfiles[*]}" ]; then
  for file in "${dotfiles[@]}"; do
    create_symlink "${PWD}/${file}" "${HOME}/.${file}"
  done
  create_symlink "${PWD}/starship.toml" "${HOME}/.config/starship.toml"
fi

# .config directories
config_dirs=(nvim wezterm bat ghostty opencode)
config_basedir="${HOME}/.config"

if [ -n "${config_dirs[*]}" ]; then
  for dir in "${config_dirs[@]}"; do
    create_symlink "${PWD}/${dir}" "${config_basedir}/${dir}"
  done
fi

# opencode plugin dependencies (node_modules is not committed)
if [ -f "${PWD}/opencode/package.json" ]; then
  if command_exists npm; then
    (cd "${PWD}/opencode" && npm install)
  else
    echo "npm not found — install nodejs (see tool-versions) and re-run to set up opencode dependencies"
  fi
fi

# pull the local models referenced in opencode/opencode.jsonc
if command_exists ollama; then
  if ollama list &>/dev/null; then
    for model in "llama3.2:latest" "dagbs/qwen2.5-coder-1.5b-instruct-abliterated:q4_k_m"; do
      if ! ollama list 2>/dev/null | awk 'NR > 1 { print $1 }' | grep -qx "$model"; then
        echo "Pulling ollama model: $model"
        ollama pull "$model"
      fi
    done
  else
    echo "ollama server not reachable — run 'ollama serve' and pull the models from opencode/opencode.jsonc manually"
  fi
fi

# ~/bin scripts (theme-mode, theme-apply-tmux.sh — used by zshrc/tmux.conf)
mkdir -p "${HOME}/bin"
for script in bin/*; do
  create_symlink "${PWD}/${script}" "${HOME}/${script}"
done
# install tmux plugin manager
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

# install antidote plugin manager for zsh
if [ ! -d "$HOME/.antidote" ]; then
  echo "Installing antidote..."
  git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote
fi
