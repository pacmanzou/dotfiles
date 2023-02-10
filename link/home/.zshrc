#!/usr/bin/env zsh

# environment variable
export LANG=zh_CN.UTF-8
export SUDO_ASKPASS=/usr/lib/seahorse/ssh-askpass

# golang
export PATH=$PATH:$HOME/go/bin
export GOPATH=$HOME/go
export GOPROXY=https://goproxy.cn,direct

# yarn
export PATH=$PATH:$HOME/.yarn/bin

# less
export LESS='--tabs=4 --no-init --LONG-PROMPT --ignore-case --quit-if-one-screen --RAW-CONTROL-CHARS'
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# history
export HISTFILE="$HOME/.zsh_history"

HISTSIZE=10000000
SAVEHIST=10000000

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify
setopt hist_reduce_blanks
setopt inc_append_history
setopt share_history

# key
bindkey -e

# unmap c-s
stty -ixon

autoload -U edit-command-line

zle -N edit-command-line

bindkey -r '^Q'
bindkey -r '^O'
bindkey -r '^S'
bindkey -r '^G'
bindkey -r '^J'
bindkey -r '^K'
bindkey -r '^Z'
bindkey -r '^V'

bindkey '^U' backward-kill-line

# highlight and autosuggestions for zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -Uz compinit promptinit vcs_info colors

compinit
promptinit
precmd() { vcs_info }
colors

zstyle ':vcs_info:*:*' formats "%r" " %b"

setopt PROMPT_SUBST

git_dirty() {
    # Check if we're in a git repo
    command git rev-parse --is-inside-work-tree &>/dev/null || return
    # Check if it's dirty
    command git diff --quiet --ignore-submodules HEAD &>/dev/null; [ $? -eq 1 ] && echo "*"
}

# prompt
PROMPT='%B%F{green}%n@%m%f%b %~ $vcs_info_msg_1_$(git_dirty)$prompt_newline:'

# alias
alias sudo='sudo -E'
alias qtdq='sudo pacman -Rns $(pacman -Qtdq)'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias grep='grep --colour=auto'
alias df='df -h'
alias free='free -m'
alias more=less

if (( $+commands[exa] )); then
    alias ls='exa -gH --time-style=iso --icons'
else
    alias ls='ls --color=tty --time-style=iso'
fi

# function
function setzh {
  export LANG=zh_CN.UTF-8
}

function seten {
  export LANG=en_US.UTF-8
}

function mkcd {
    command mkdir "$1" && cd "$1" || exit
}

function ei {
    go mod init "$(basename "$(pwd)")" && touch main.go
}

# # extract - archive extractor
# # usage: extract <file>
extract ()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1   ;;
            *.tar.gz)    tar xzf $1   ;;
            *.bz2)       bunzip2 $1   ;;
            *.rar)       unrar x $1   ;;
            *.gz)        gunzip $1    ;;
            *.tar)       tar xf $1    ;;
            *.tbz2)      tar xjf $1   ;;
            *.tgz)       tar xzf $1   ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1;;
            *.7z)        7z x $1      ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
            esac
    else
        echo "'$1' is not a valid file"
    fi
}

# tmux
if [ -z "$TMUX" ]; then
    SESSION_NAME="localhost"
    tmux new-session -s $SESSION_NAME
fi

# fzf
source /usr/share/fzf/completion.zsh

if command -v fd > /dev/null; then
    export FZF_DEFAULT_COMMAND="fd --type f --follow --exclude .git"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

__fsel() {
  local cmd="${FZF_CTRL_T_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | cut -b3-"}"
  setopt localoptions pipefail no_aliases 2> /dev/null
  local item
  eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" $(__fzfcmd) -m "$@" | while read item; do
    echo -n "${(q)item} "
  done
  local ret=$?
  echo
  return $ret
}

__fzfcmd() {
  [ -n "$TMUX_PANE" ] && { [ "${FZF_TMUX:-0}" != 0 ] || [ -n "$FZF_TMUX_OPTS" ]; } &&
    echo "fzf-tmux ${FZF_TMUX_OPTS:--d${FZF_TMUX_HEIGHT:-40%}} -- " || echo "fzf"
}

fzf-file-widget() {
  LBUFFER="${LBUFFER}$(__fsel)"
  local ret=$?
  zle reset-prompt
  return $ret
}

fzf-history-widget() {
  local selected num
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
  selected=( $(fc -rl 1 | perl -ne 'print if !$seen{(/^\s*[0-9]+\**\s+(.*)/, $1)}++' |
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort,ctrl-z:ignore $FZF_CTRL_R_OPTS --query=${(qqq)LBUFFER} +m" $(__fzfcmd)) )
  local ret=$?
  if [ -n "$selected" ]; then
    num=$selected[1]
    if [ -n "$num" ]; then
      zle vi-fetch-history -n $num
    fi
  fi
  zle reset-prompt
  return $ret
}

zle -N fzf-file-widget
zle -N fzf-history-widget

bindkey '^T' fzf-file-widget
bindkey '^R' fzf-history-widget
