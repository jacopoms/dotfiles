# ============================================================================
# Modern Zsh Configuration - Optimized for Performance
# ============================================================================

# ----------------------------------------------------------------------------
# Early Initialization (must be first)
# ----------------------------------------------------------------------------
[[ -f "$HOME/.env" ]] && source "$HOME/.env"
[[ -x "$HOME/.local/bin/agent" ]] && eval "$(~/.local/bin/agent shell-integration zsh)"

# ----------------------------------------------------------------------------
# Environment Variables - Consolidated
# ----------------------------------------------------------------------------
export ASDF_DATA_DIR="$HOME/.asdf"
export EDITOR=nvim
export VISUAL="$EDITOR"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Docker settings
export DOCKER_COMPOSE_TIMEOUT=200
export COMPOSE_HTTP_TIMEOUT=200

# Increase file descriptor limit
ulimit -n 10240

# ----------------------------------------------------------------------------
# PATH Configuration - Optimized order (most specific first)
# ----------------------------------------------------------------------------
path=(
  "$HOME/.local/bin"
  "$HOME/.atuin/bin"
  "$HOME/.antigravity/antigravity/bin"
  "$ASDF_DATA_DIR/shims"
  "$HOME/bin"
  $path  # Keep existing PATH entries
)

# Conditional PATH additions
if [[ "$APPLE_CHIP" == true ]]; then
  path=(/opt/homebrew/bin /opt/homebrew/sbin $path)
else
  path=(/usr/local/bin /usr/local/sbin $path)
fi

# Remove duplicates and non-existent directories
typeset -U path
path=($^path(N-/))

# ----------------------------------------------------------------------------
# Homebrew & Package Manager Setup
# ----------------------------------------------------------------------------
if (( $+commands[brew] )); then
  if [[ "$APPLE_CHIP" == true ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    eval "$(/usr/local/bin/brew shellenv)"
  fi

  # FZF setup
  export FZF_BASE="$(brew --prefix)/bin/fzf"

  # Completion paths
  fpath=(
    "$(brew --prefix)/share/zsh/site-functions"
    "${ASDF_DIR}/completions"
    $fpath
  )
else
  # MacPorts fallback
  [[ -f /opt/local/share/asdf/asdf.sh ]] && . /opt/local/share/asdf/asdf.sh
  [[ -f /opt/local/share/fzf/shell/completion.zsh ]] && source /opt/local/share/fzf/shell/completion.zsh
  [[ -f /opt/local/share/fzf/shell/key-bindings.zsh ]] && source /opt/local/share/fzf/shell/key-bindings.zsh

  export FZF_BASE="/opt/local/bin/fzf"
  fpath=("${ASDF_DATA_DIR:-$HOME/.asdf}/completions" $fpath)
fi

# ----------------------------------------------------------------------------
# History Configuration
# ----------------------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# History options
setopt HIST_SAVE_NO_DUPS      # Don't write duplicate entries
setopt INC_APPEND_HISTORY     # Write to history immediately
setopt SHARE_HISTORY          # Share history between sessions
setopt HIST_IGNORE_SPACE      # Ignore commands starting with space
setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks

# ----------------------------------------------------------------------------
# Antidote Plugin Manager
# ----------------------------------------------------------------------------
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# Set ZSH variable for oh-my-zsh plugins
export ZSH="$(antidote path ohmyzsh/ohmyzsh)"

# Load plugins (generates static file if needed)
antidote load

# ----------------------------------------------------------------------------
# Completion System
# ----------------------------------------------------------------------------
# Add Docker completions to fpath
fpath=("$HOME/.docker/completions" $fpath)

# Initialize completion system
autoload -Uz compinit

# Speed up compinit by only checking once a day
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# ----------------------------------------------------------------------------
# Key Bindings
# ----------------------------------------------------------------------------
# History substring search
bindkey "^[[A" history-substring-search-up      # Up arrow
bindkey "^[[B" history-substring-search-down    # Down arrow

# Autosuggestions
bindkey "^[[Z" autosuggest-accept               # Shift+Tab

# ----------------------------------------------------------------------------
# FZF Configuration
# ----------------------------------------------------------------------------
export FZF_COMPLETION_TRIGGER="@@"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# FZF preview configurations
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
export FZF_CTRL_T_OPTS="--preview 'if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi'"

# Custom FZF functions
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

# ----------------------------------------------------------------------------
# External Tool Integrations
# ----------------------------------------------------------------------------
# Zoxide (smart cd)
(( $+commands[zoxide] )) && eval "$(zoxide init zsh)"

# Starship prompt (fast Rust-based)
# (( $+commands[starship] )) && eval "$(starship init zsh)"

# Oh My Posh
(( $+commands[oh-my-posh])) && eval "$(oh-my-posh init zsh --config ~/.omp-theme.json)"

# Atuin (shell history sync)
if [[ -f "$HOME/.atuin/bin/env" ]]; then
  . "$HOME/.atuin/bin/env"
  eval "$(atuin init zsh --disable-up-arrow)"
fi

# Stern (Kubernetes log viewer)
(( $+commands[stern] )) && source <(stern --completion=zsh)

# Kubectl completion (only if installed)
if (( $+commands[kubectl] )); then
  source <(kubectl completion zsh)
  complete -o default -F __start_kubectl k
fi

# SSH agent
eval "$(ssh-agent -s)" &>/dev/null

# ----------------------------------------------------------------------------
# Aliases & Custom Functions
# ----------------------------------------------------------------------------
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases
