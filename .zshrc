typeset -U path
path=(
  /opt/homebrew/{bin,sbin}
  $HOME/bin
  /opt/homebrew/opt/{ruby,llvm}/bin
  $GOPATH/bin
  /Library/TeX/texbin
  $path
)

alias ls="$(command -v gls >/dev/null 2>&1 && echo 'gls --group-directories-first --color=auto -hF' || echo 'ls -GhF')"
alias grep="grep --color=auto --exclude-dir={.git,node_modules,__pycache__,.venv,.vscode}"
mkcd() { mkdir -p "$1" && cd "$1" }

autoload -Uz vcs_info compinit && compinit
zstyle ":completion:*" matcher-list "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=*" "l:|=* r:|=*"
setopt AUTO_MENU
setopt MENU_COMPLETE

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr '*'
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

precmd() { vcs_info }
setopt PROMPT_SUBST

export PROMPT="%F{green}%n@%m%f %F{blue}%~%f %# "
export RPROMPT="\$vcs_info_msg_0_"

HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

bindkey -v 
bindkey '^[f' forward-word 
bindkey '^[b' backward-word 
bindkey '^R' history-incremental-search-backward
bindkey '^[[Z' reverse-menu-complete

# Lazy loading nvm
if [[ -s "$HOME/.nvm/nvm.sh" ]]; then
  nvm_cmds=(nvm node npm yarn)
  for cmd in $nvm_cmds; do
    alias $cmd="unalias $nvm_cmds && unset nvm_cmds && . $NVM_DIR/nvm.sh && $cmd"
  done
fi

# Load nvm bash completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
