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
alias wake-proxmox="ssh -p 8022 u0_a221@100.123.228.76 'python ~/wol.py F0:DE:F1:11:F3:41'"

eval "$(zoxide init --cmd cd zsh)"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L$HOMEBREW_PREFIX/opt/llvm/lib/c++ -L$HOMEBREW_PREFIX/opt/llvm/lib/unwind -lunwind"
export HOMEBREW_NO_AUTO_UPDATE=1

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mmkamron/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mmkamron/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mmkamron/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mmkamron/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Added by Windsurf
export PATH="/Users/mmkamron/.codeium/windsurf/bin:$PATH"

# bun completions
[ -s "/Users/mmkamron/.bun/_bun" ] && source "/Users/mmkamron/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
