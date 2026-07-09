# ===== Environment =====
export XDG_CONFIG_HOME="$HOME/.config"
export EZA_CONFIG_DIR="$XDG_CONFIG_HOME/eza"
export PATH="$HOME/go/bin:$HOME/.maestro/bin:$PATH"

# ===== Completion =====
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"
fi
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # case-insensitive
zstyle ':completion:*' menu select

# ===== History =====
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY        # share history across sessions
setopt HIST_IGNORE_ALL_DUPS # drop older duplicate entries
setopt HIST_FIND_NO_DUPS    # no duplicates while searching
setopt HIST_REDUCE_BLANKS   # trim superfluous whitespace
setopt HIST_IGNORE_SPACE    # don't record commands starting with a space

# ===== Key bindings =====
bindkey "\e[1;3D" backward-word
bindkey "\e[1;3C" forward-word
bindkey "^[[1;9D" beginning-of-line
bindkey "^[[1;9C" end-of-line

# ===== Aliases =====
alias ls='eza --icons --color=always'
alias la='ls -lAH --no-permissions'
alias cat='bat'
alias cl='clear;clear'
alias dr='docker run --rm -it'
alias dx='docker exec -it'
alias db='docker build -t'
alias airflow='airflowctl'

# ===== Prompt & tools =====
eval "$(oh-my-posh init zsh --config ~/.config/omp/config.json)"
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"

# ===== Plugins (syntax-highlighting must stay last) =====
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
