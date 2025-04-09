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
alias ls="eza"
alias v="nvim"
alias V="sudo vim"
alias sz="screen zathura"
alias venv="source env/bin/activate"
alias g="git clone"
alias grep="rga"
alias cat="bat"
alias find="fd"
alias dig="dog"
alias curl="curlie"

eval "$(zoxide init --cmd cd zsh)"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L$HOMEBREW_PREFIX/opt/llvm/lib/c++ -L$HOMEBREW_PREFIX/opt/llvm/lib/unwind -lunwind"
export HOMEBREW_NO_AUTO_UPDATE=1

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mmkamron/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mmkamron/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mmkamron/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mmkamron/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
