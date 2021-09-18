git_current_branch() {
  git branch | grep \* | cut -d' ' -f2
}

alias g='git'

alias ga='git add'

alias gb='git branch'
alias gbd='git branch -d'
alias gbD='git branch -D'

alias gc='git commit -v'
alias gcb='git checkout -b'
alias gcm='git checkout master'
alias gcmsg='git commit -m'
alias gcn!='git commit --amend --no-edit'
alias gco='git checkout'

alias gd='git diff'

alias gf='git fetch'

alias glog='git log --oneline --graph --decorate'

alias ggpull='git pull origin "$(git_current_branch)"'
alias ggpush='git push origin "$(git_current_branch)"'

alias gm='git merge'

alias gst='git status'
