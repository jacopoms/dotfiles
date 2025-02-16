# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/opt/local/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/.local/bin:$PATH
export ASDF_DATA_DIR=$HOME/.asdf
export PATH="$ASDF_DATA_DIR/shims:$PATH"
# export PATH=$HOME/nvim-osx64/bin:$PATH
# export PATH=$HOME/.asdf/installs/rust/1.66.1/bin:$PATH
source $HOME/.env

eval "$(/opt/homebrew/bin/brew shellenv)"

# autocompletions
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  # append completions to fpath
  fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
  autoload -Uz compinit
  compinit
fi
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export FZF_BASE="/opt/homebrew/bin/fzf"

# auto updates fro omz
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 0

# omz plugins
plugins=(
  aliases
  asdf
  git
  gitfast
  colorize
  fzf
  zsh-syntax-highlighting
  zsh-navigation-tools
  zsh-completions
  git-auto-fetch
  history-substring-search
  history
  zsh-autosuggestions
  kubectl
  kubectx
)

# omz theme
#### powerlevel10k settings
# ZSH_THEME="powerlevel10k/powerlevel10k"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

source $ZSH/oh-my-zsh.sh

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey "^[[Z" autosuggest-accept

# User configuration

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8


source ~/.bash_aliases

export PROJECTS_ROOT="$HOME/Projects"

eval $(ssh-agent)

export DOCKER_COMPOSE_TIMEOUT=200
export COMPOSE_HTTP_TIMEOUT=200
export EDITOR=nvim
export VISUAL="$EDITOR"

ctags=/usr/local/bin/ctags

# git configuration
#eval "$(hub alias -s)"

# K8s config
if [ -x /usr/local/bin/kubectl ]; then
    source <(kubectl completion zsh);
    complete -o default -F __start_kubectl k;
fi
## FZF conf

# export FZF_DEFAULT_OPTS="
# --layout=reverse
# --info=inline
# --height=80%
# --multi
# --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
# --color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
# --prompt='∼ ' --pointer='▶' --marker='✓'
# --bind '?:toggle-preview'
# --bind 'ctrl-a:select-all'
# --bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
# --bind 'ctrl-e:execute(echo {+} | xargs -o nvim)'
# "
export FZF_COMPLETION_TRIGGER="@@"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"

export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

export HISTTIMEFORMAT="%F %T "

# bat config
# export BAT_THEME=tokyonight_night

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/usr/local/opt/libpq/bin:$PATH"


source <(stern --completion=zsh)

ulimit -n 10240

eval "$(starship init zsh)"
