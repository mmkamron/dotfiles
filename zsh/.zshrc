bindkey -v
bindkey ^R history-incremental-search-backward 
bindkey ^S history-incremental-search-forward
PROMPT='%~%f> '
zstyle ':completion:*:descriptions' format ''

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Aliases
alias ls="ls --color"
alias v="nvim"
alias V="sudo vim"
alias p="sudo pacman"
alias g="git clone"
alias z="nohup zathura"

eval "$(zoxide init --cmd cd zsh)"
