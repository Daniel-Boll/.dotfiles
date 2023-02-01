if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx -- vt1 &> /var/log/dwm
fi

if [[ $(tty) = /dev/tty2 ]]; then
  exec startx /usr/bin/awesome -- :1 vt2
fi

if [[ ! $(tmux ls) ]] 2> /dev/null; then
  tmux new -s ﬦ
fi

# Find and divide the number os instances of kitty by 2, because each instance of kitty has two processes.
has_instance_of_kitty=$(ps -A | awk '{print $4}' | grep 'kitty' | wc -l)
has_instance_of_kitty=$((has_instance_of_kitty / 2))

# If there is only one instance of kitty, then it is the one we want to use.
if [[ $has_instance_of_kitty -eq 1 ]] && [[ -z $TMUX ]]; then
  tmux attach
fi

# export DISPLAY=:0

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

### End of Zinit's installer chunk
