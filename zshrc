# binds

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey "^H" backward-kill-word
bindkey "^[[3;5~" kill-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# plugins

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf

source <(fzf --zsh)

export FZF_DEFAULT_OPTS='
    --height 40%
    --layout=reverse
    --border=rounded
    --info=inline
    --prompt="> "
    --pointer="▶"
    --marker="✓"
'
# completion

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# starship

eval "$(starship init zsh)"

# fastfetch

if [[ -o interactive ]]; then
    fastfetch
fi

# aliases

alias c='clear'
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias update='sudo pacman -Syu'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'
alias cleanup='clean-cache'

alias grep='grep --color=auto'
alias df='df -h'
alias free='free -h'

alias ports='ss -tulpn'
alias failed='systemctl --failed'

alias config='cd ~/.config'
alias hypr='cd ~/.config/hypr'
alias waybar='cd ~/.config/waybar'
alias scripts='cd ~/.local/bin'

alias fast='fastfetch'
alias reload='source ~/.zshrc'

# history

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

export PATH="$HOME/.local/bin:$PATH"