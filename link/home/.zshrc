#!/usr/bin/env zsh

# environment variable
export PATH=$PATH:/usr/bin
export PATH=$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin
export PATH=$PATH:$HOME/.config/yarn/global/node_modules/.bin
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/go/bin
export GOPROXY=https://goproxy.cn,direct
# export GOPROXY=https://goproxy.io
# export GOPROXY=https://mirrors.aliyun.com/goproxy/
export BROWSER=/usr/bin/google-chrome-stable
export EDITOR=/usr/bin/nvim
export SUDO_ASKPASS=/usr/lib/seahorse/ssh-askpass

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

bindkey -r '^J'
bindkey -r '^G'
bindkey -r '^Q'
bindkey -r '^O'
bindkey -r '^Z'

bindkey '^V' edit-command-line
bindkey '^U' backward-kill-line
bindkey '^K' kill-line
bindkey '^S' kill-word

# highlight and autosuggestions for zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -Uz compinit promptinit vcs_info

compinit
promptinit
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '[git(%b)] '

setopt PROMPT_SUBST

# zsh prompt
PROMPT='%n@%m %~ ${vcs_info_msg_0_}[%D{%L:%M}] $prompt_newline:'

# fzf
source /usr/share/fzf/completion.zsh

if command -v fd > /dev/null; then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
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

# alias
alias syy='sudo pacman -Syy'
alias syu='sudo pacman -Syu'
alias syyu='sudo pacman -Syyu'
alias scc='sudo pacman -Scc'
alias sudo='sudo -E'
alias qtdq='sudo pacman -Rns $(pacman -Qtdq)'
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias ra='ranger'
alias lg='lazygit'

# misc
if [ -z "$TMUX" ]; then
    SESSION_NAME="LOCALHOST"
    tmux new-session -s $SESSION_NAME
fi

if (( $+commands[exa] )); then
    alias ls='exa -gH --time-style=iso --icons'
    alias la='ls -la '
    alias ll='ls -l'
else
    alias ls='ls --color=tty --time-style=iso'
    alias la='ls -la'
    alias ll='ls -l'
fi
