bindkey -v
bindkey ^R history-incremental-search-backward 
bindkey ^S history-incremental-search-forward

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
alias vim="nvim"

eval "$(zoxide init --cmd cd zsh)"
