# vim:ft=bash

alias ls="exa --long --git"
alias md="mkdir -p"
alias rf="rm -rf"

alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias glols="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --stat"
alias glod="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
alias glods="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias glola="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all"
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glp="_git_log_prettily"

alias sign-commit="git commit -S -s --amend --no-edit"
alias pingle="ping 8.8.4.4"

alias nvim="nvim +':Telescope find_files'"
alias vim="nvim"
alias e="nvim"
alias open="nvim"

yS() {
  yay -Slq | fzf -m --preview 'cat <(yay -Si {1}) <(yay -F1 {1} | awk "{print \$2}")' | xargs -ro yay -S
}

yR() {
  yay -Qq | fzf --multi --preview 'yay -Qi {1}' | xargs -ro sudo yay -Rns
}

update() {
  yay -Syu --noconfirm
  kill -SIGUSR1 $(ps aux | grep bar.sh | grep bash | cut -d ' ' -f3)
}
