#!/bin/zsh

# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/danielboll/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

CONF_DIR="$HOME/.zsh"
[ -f "$CONF_DIR/startup.zsh" ] && source "$CONF_DIR/startup.zsh"

for conf in $(/usr/bin/ls $CONF_DIR | grep -v 'startup'); do
	source "${CONF_DIR}/${conf}"
done

unset CONF_DIR
unset conf

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/danielboll/dev/ctf/google-cloud-sdk/path.zsh.inc' ]; then . '/home/danielboll/dev/ctf/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/danielboll/dev/ctf/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/danielboll/dev/ctf/google-cloud-sdk/completion.zsh.inc'; fi

# >>> xmake >>>
[[ -s "$HOME/.xmake/profile" ]] && source "$HOME/.xmake/profile" # load xmake profile
# <<< xmake <<<
