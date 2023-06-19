if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx -- vt1 &> /var/log/dwm
fi

if [[ $(tty) = /dev/tty2 ]]; then
  exec startx /usr/bin/awesome -- :1 vt2
fi

if [[ ! $(tmux ls) ]] 2> /dev/null; then
  tmux new -s λ
fi

# Find and divide the number os instances of kitty by 2, because each instance of kitty has two processes.
has_instance_of_kitty=$(ps -A | awk '{print $4}' | grep 'kitty' | wc -l)
has_instance_of_kitty=$((has_instance_of_kitty / 2))

# If there is only one instance of kitty, then it is the one we want to use.
if [[ $has_instance_of_kitty -eq 1 ]] && [[ -z $TMUX ]]; then
  tmux attach
fi

# export DISPLAY=:0

# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/danielboll/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

### Added by Zinit's installer
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk
