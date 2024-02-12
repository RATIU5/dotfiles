eval "$(/opt/homebrew/bin/brew shellenv)"
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)"
alias gcm='git commit -m'
alias gaa='git add -A'
alias gco='git checkout'
alias gpl='git pull'
alias gps='git push'
alias gst='git status'
alias gbr='git branch'
alias gpo='git push origin'
alias gdf='git diff'
alias dev='cd ~/Developer'
alias doc='cd ~/Documents'
alias des='cd ~/Desktop'
alias dow='cd ~/Downloads'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias c='clear'
alias mkcd='mkdir $1 && cd $1'
alias vim='nvim'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias ls='eza'
alias lst='eza --tree'
alias fzf='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
alias fzb='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
alias neofetch='macchina'

export PATH=$N_PREFIX/bin:$PATH
