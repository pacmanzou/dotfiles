#!/usr/bin/env zsh

# environment variable
export PATH=$PATH:/usr/bin
export PATH=$PATH:$HOME/.gem/ruby/2.7.0/bin
export PATH=$PATH:$HOME/.config/yarn/global/node_modules/.bin
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/go/bin
export GOPROXY=https://goproxy.cn,direct
# export GOPROXY=https://goproxy.io
# export GOPROXY=https://mirrors.aliyun.com/goproxy/
export BROWSER="chromium"
export EDITOR=nvim
export VISUAL=nvim
export BAT_THEME=TwoDark
export BAT_STYLE=plain

# less
export LESS='--tabs=4 --no-init --LONG-PROMPT --ignore-case --quit-if-one-screen --RAW-CONTROL-CHARS'
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
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

autoload -U edit-command-line fzf-cd-widget

zle -N edit-command-line
zle -N fzf-cd-widget


bindkey '^V' edit-command-line
bindkey '^U' backward-kill-line
bindkey '^K' kill-line
bindkey '^S' kill-word
bindkey '^Q' fzf-cd-widget

# highlight and autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -U compinit promptinit

compinit
promptinit

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

if command -v fd > /dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND='fd --type f --type d --hidden --follow --exclude .git'
fi

# my_prompt
prompt_suse_setup () {
  PS1=" %n@%m %~/$prompt_newline➤ "
  PS2="➤ "
  prompt_opts=( cr percent )
}

prompt_suse_setup "$@"

# alias
alias r='ranger'
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

if (( $+commands[exa] )); then
    alias ls='exa -gH --time-style=iso '
    alias la='ls -la '
    alias ll='ls -l'
else
    alias ls='ls --color=tty --time-style=iso'
    alias la='ls -la'
    alias ll='ls -l'
fi

# misc
if [ -z "$TMUX" ]; then
    SESSION_NAME="LOCALHOST"
    tmux new-session -s $SESSION_NAME
fi
