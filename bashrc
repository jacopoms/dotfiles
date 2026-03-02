# ============================================================================
# Bash Configuration (essentials, ported from .zshrc)
# ============================================================================

# Source environment variables
[[ -f "$HOME/.env" ]] && source "$HOME/.env"

# ----------------------------------------------------------------------------
# Environment Variables
# ----------------------------------------------------------------------------
export ASDF_DATA_DIR="$HOME/.asdf"
export EDITOR=nvim
export VISUAL="$EDITOR"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export DOCKER_COMPOSE_TIMEOUT=200
export COMPOSE_HTTP_TIMEOUT=200
export AWS_VAULT_BACKEND="file"
export KUBECONFIG="$HOME/.kube/config:$HOME/.kube/cx-api-production.config:$HOME/.kube/cx-api-staging.config"

ulimit -n 10240

# ----------------------------------------------------------------------------
# PATH Configuration
# ----------------------------------------------------------------------------
# Homebrew (Apple Silicon)
if [[ "$(uname -m)" == "arm64" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Prepend local and tool bins
export PATH="$ASDF_DATA_DIR/shims:$HOME/.local/bin:$HOME/.atuin/bin:$HOME/bin:$PATH"

# Cargo
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

# ----------------------------------------------------------------------------
# ASDF Version Manager
# ----------------------------------------------------------------------------
if [[ -f "$HOME/.asdf/asdf.sh" ]]; then
  . "$HOME/.asdf/asdf.sh"
  [[ -f "$HOME/.asdf/completions/asdf.bash" ]] && . "$HOME/.asdf/completions/asdf.bash"
fi

# ----------------------------------------------------------------------------
# FZF
# ----------------------------------------------------------------------------
[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# ----------------------------------------------------------------------------
# Zoxide (smart cd)
# ----------------------------------------------------------------------------
command -v zoxide &>/dev/null && eval "$(zoxide init bash)"

# ----------------------------------------------------------------------------
# Atuin (shell history sync)
# ----------------------------------------------------------------------------
if [[ -f "$HOME/.atuin/bin/env" ]]; then
  . "$HOME/.atuin/bin/env"
  [[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
  eval "$(atuin init bash)"
fi

# ----------------------------------------------------------------------------
# Aliases & Functions
# ----------------------------------------------------------------------------
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases
