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
alias man="batman"
alias ls="eza"
alias l="eza -lah"
alias v="nvim"
alias V="sudo vim"
alias p="sudo pacman"
alias g="git clone"
alias z="zathura"
alias grep="rga"
alias cat="bat"
alias find="fd"
alias dig="dog"
alias df="dysk"
alias mpv="mpv"
alias rss="newsboat -C ~/.config/newsboat/config"

eval "$(zoxide init --cmd cd zsh)"

nru() {
  nix run --impure --option allowUnfree true --option allowInsecure true "nixpkgs#$1"
}

nr() {
  nix run "nixpkgs#$1" -- "${@:2}"
}

ns() {
  nix-shell -p $1
}
