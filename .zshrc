# Paths / Environment
export XDG_CONFIG_HOME="$HOME/.config"
export EZA_CONFIG_DIR="$HOME/.config/eza"
export NVM_DIR="$HOME/.nvm"
export PATH="/Users/emin.ozata/.rustup/toolchains/stable-aarch64-apple-darwin/bin:$PATH"

# Homebrew completions
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"
fi

# Completion system
autoload -Uz compinit
compinit

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# History
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# Prompt
eval "$(oh-my-posh init zsh --config ~/.config/omp/config.json)"

# Tools
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"

# NVM
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# Aliases
alias ls='eza --icons --color=always'
alias la='ls -lAH --no-permissions'
alias cl='clear;clear'
alias dr='docker run --rm -it'
alias dx='docker exec -it'
alias db='docker build -t'
alias cat='bat'
alias airflow='airflowctl'

# Key bindings
bindkey "\e[1;3D" backward-word
bindkey "\e[1;3C" forward-word
bindkey "^[[1;9D" beginning-of-line
bindkey "^[[1;9C" end-of-line

# Plugins
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="$(go env GOPATH)/bin:$PATH"
