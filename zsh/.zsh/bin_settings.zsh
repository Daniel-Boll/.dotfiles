#####################
# FZF SETTINGS      #
#####################
export FZF_DEFAULT_OPTS="
--ansi
--layout=default
--info=inline
--multi
--preview-window=right:50%
--preview-window=sharp
--preview-window=cycle
--preview '([[ -f {} ]] && (bat --style=numbers --color=always --theme=gruvbox-dark --line-range :500 {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--prompt='ﬦ -> '
--pointer='👉'
--marker='✅'
--bind 'ctrl-e:execute(nvim {} < /dev/tty > /dev/tty 2>&1)' > selected
--bind 'ctrl-v:execute(code {+})'"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

#####################
# NVM               #
#####################
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

#####################
# ZOXIDE            #
#####################
eval "$(zoxide init zsh)"

#####################
# STARSHIP          #
#####################
eval "$(starship init zsh)"

#####################
# NEOVIM            #
#####################
export PATH="$HOME/.local/share/neovim/bin:$PATH"

#####################
# SCRIPTS           #
#####################
export PATH="$HOME/scripts:$PATH"

#####################
# GIT               #
#####################
export GPG_TTY=$(tty)

#####################
# CARGO             #
#####################
# source $HOME/.cargo/env
export PATH="$HOME/.cargo/bin:$PATH"

#####################
# PNPM              #
#####################
export PNPM_HOME="/home/danielboll/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

#####################
# XMAKE             #
#####################
[[ -s "$HOME/.xmake/profile" ]] && source "$HOME/.xmake/profile" # load xmake profile

#####################
# TERRAFORM         #
#####################
# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /usr/bin/terraform terraform

#####################
# WASI_SDK          #
#####################
# export WASI_VERSION=14
# export WASI_VERSION_FULL=${WASI_VERSION}.0
# export WASI_SDK_PATH=$HOME/wasi-sdk/wasi-sdk-${WASI_VERSION_FULL}

#####################
# BINARYEN          #
#####################
# export PATH="$HOME/wasi-sdk/binaryen/bin:$PATH"

#####################
# SSH-AGENT         #
#####################
runcount=$(ps -ef | grep "ssh-agent" | grep -v "grep" | wc -l)
if [ $runcount -eq 0 ]; then
  eval `ssh-agent -s`

  ssh-add -l &>/dev/null
  if [ $? -ne 0 ]; then
    ssh-add -t 1d
    ssh-add -t 1d ~/.ssh/smartbr_ed25519
  fi
fi

#####################
# ASDF		    #
#####################
. "$HOME/.asdf/asdf.sh"
