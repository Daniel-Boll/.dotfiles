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

alias nvim="nvim"
alias vim="nvim"
alias e="nvim +':Telescope find_files'"
alias open="nvim +':Telescope find_files'"

alias peak="./build/linux/x86_64/release/peak"

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

compile() {
  xmake && xmake project -k compile_commands
  if [ "$1" = "r" ] || [ "$1" = "run" ]; then
    xmake run $2
  fi
}

# Docker compose aliases
alias dcu="docker-compose up -d"
alias dcd="docker-compose down --remove-orphans"
alias dcr="docker-compose restart"

dcl() {
  docker-compose logs -f --tail=100 $1
}

dce() {
  docker-compose exec -it $1 $2
}
