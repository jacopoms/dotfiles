# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/.local/bin:$PATH
# export PATH=$HOME/nvim-osx64/bin:$PATH
# export PATH=$HOME/.asdf/installs/rust/1.66.1/bin:$PATH
source $HOME/.env

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
export ZSH="/Users/jacopo/.oh-my-zsh"
export FZF_BASE="/usr/local/bin/fzf"

# auto updates fro omz
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 0

# omz plugins
plugins=(
  aliases
  asdf
  # bundler
  git
  gitfast
  autojump
  colorize
  fzf
  zsh-interactive-cd
  zsh-syntax-highlighting
  zsh-navigation-tools
  zsh-autosuggestions
  zsh-completions
  git-auto-fetch
  history-substring-search
  history
  tmux
)

# omz theme
# ZSH_THEME="spaceship"
# ZSH_THEME="random"

#### powerlevel10k settings
ZSH_THEME="powerlevel10k/powerlevel10k"
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

# User configuration

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

source $HOME/.zprofile

source ~/.bash_aliases

export PATH="/usr/local/opt/postgresql@13/bin:$PATH"
export PATH="/usr/local/opt/postgresql@14/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

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
export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--height=80%
--multi
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
--prompt='∼ ' --pointer='▶' --marker='✓'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
--bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
--bind 'ctrl-e:execute(echo {+} | xargs -o nvim)'
"
export FZF_COMPLETION_TRIGGER='**'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey "ç" fzf-cd-widget
export HISTTIMEFORMAT="%F %T "

## Env Variables for libffi library
export LDFLAGS="-L/usr/local/opt/libffi/lib"
export CPPFLAGS="-I/usr/local/opt/libffi/include"
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/usr/local/opt/libpq/bin:$PATH"


# cargo env

. "$HOME/.cargo/env"

source <(stern --completion=zsh)
# eval "$(starship init zsh)"

ulimit -n 10240
