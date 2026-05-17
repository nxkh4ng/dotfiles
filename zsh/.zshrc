[[ $- != *i* ]] && return

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=20000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# Lesspipe
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Zsh completion
autoload -Uz compinit && compinit

# Grep color
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_CURL_RETRIES=3

# Go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# FZF
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git --threads 4"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude .git --max-depth 4"

export FZF_DEFAULT_OPTS="\
--ansi \
--no-mouse \
--height=50% \
--info=right \
--layout=reverse \
--border=none \
--bind='alt-n:down' \
--bind='alt-p:up' \
--bind='alt-N:preview-down' \
--bind='alt-P:preview-up'"

export FZF_CTRL_R_OPTS="--no-preview"

export FZF_CTRL_T_OPTS="\
--preview='bat --color=always --line-range=:100 {}' \
--preview-window=right:50%:border-sharp \
--bind='ctrl-/:toggle-preview'"

export FZF_ALT_C_OPTS="\
--preview='eza --tree --color=always --level=2 {} 2>/dev/null' \
--preview-window=right:50%:border-sharp \
--bind='ctrl-/:toggle-preview'"

eval "$(fzf --zsh)"

# EZA 
if command -v eza &>/dev/null; then
    alias ls="eza --icons --group-directories-first -l"
    alias lh="eza --icons --group-directories-first -lh"
    alias la="eza --icons --group-directories-first -la"
    alias lt="eza --icons --group-directories-first --tree"
    alias lt2="eza --icons --group-directories-first --tree --level=2"
    alias lt3="eza --icons --group-directories-first --tree --level=3"
fi

source /home/linuxbrew/.linuxbrew/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
