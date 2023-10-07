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
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

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
export PATH="$HOME/.cargo/bin:$PATH"

#####################
# GO                #
#####################
export PATH="$HOME/go/bin:$PATH"

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
# Start ssh-agent and add SSH key
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
  ssh-add ~/.ssh/id_ed25519 2> /dev/null
fi

# Set SSH_AUTH_SOCK environment variable
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

#####################
# ASDF		          #
#####################
. "$HOME/.asdf/asdf.sh"

#####################
# AWS 		          #
#####################
export AWS_ACCESS_KEY_ID=$(stoml ~/.aws/credentials default.aws_access_key_id)
export AWS_SECRET_ACCESS_KEY=$(stoml ~/.aws/credentials default.aws_secret_access_key)

#####################
# GH Copilot CLI    #
#####################
eval "$(github-copilot-cli alias -- "$0")"


#####################
# Oracle DB (Smart) #
#####################
# export TNS_ADMIN=/etc/tnsnames.ora

#####################
# Pulumi            #
#####################
export PATH=$PATH:$HOME/.pulumi/bin

#####################
# Wasmer            #
#####################
export WASMER_DIR="/home/danielboll/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
export WASMTIME_HOME="$HOME/.wasmtime"
export PATH="$WASMTIME_HOME/bin:$PATH"

#####################
# Conda             #
#####################
# [ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

#####################
# Atuin             #
#####################
# eval "$(atuin init zsh)"

#####################
# Pyenv             #
#####################
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"


#####################
# Bun               #
#####################
# bun completions
[ -s "/home/danielboll/.bun/_bun" ] && source "/home/danielboll/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bun completions
[ -s "/home/danielboll/.bun/_bun" ] && source "/home/danielboll/.bun/_bun"
# >>> xmake >>>
test -f "/home/danielboll/.xmake/profile" && source "/home/danielboll/.xmake/profile"
# <<< xmake <<<

export PNPM_HOME="/home/danielboll/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
