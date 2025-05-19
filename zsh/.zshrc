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
alias ls="eza"
alias v="nvim"
alias V="sudo vim"
alias p="sudo pacman"
alias g="git clone"
alias z="devour zathura"
alias grep="rga"
alias cat="bat"
alias find="fd"
alias dig="dog"
alias curl="curlie"
alias df="dysk"
alias mpv="devour mpv"

eval "$(zoxide init --cmd cd zsh)"

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
