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
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # This loads nvm

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
source $HOME/.cargo/env
