# # /etc/bash.bashrc # # If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

PS1='[\u@\h \W]\$ '

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

    ;;
  screen*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
esac

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

# alias
alias scf=screenfetch
alias sudo="sudo -E"
alias c=clear
alias l="ls -la *"
alias r="ranger-cd"
alias pipi="sudo -H proxychains pip install"
alias vi="nvim"
alias vim='nvim'
alias py='python3'
alias chrome="google-chrome-stable"

# tmux
alias t="tmux"
alias tsj="tmux split-window"
alias tsl="tmux split-window -h"
alias tns="tmux new -s"
alias td="tmux detach"
alias ta="tmux attach -t"
alias tls="tmux list-sessions"
alias tlk="tmux list-keys"
alias tlc="tmux list-commands"
alias tlsc="cat /etc/bash.bashrc | grep \"alias t\""
alias tks="tmux kill-session -t"
alias tss="tmux switch -t"
alias trs="tmux rename-session -t"
alias tnw="tmux new-window"
alias tsw="tmux select-window -t"
alias trw="tmux rename-window"


# some variables to change dir fastly
ycmfile="/home/zds/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py"

# set proxy
alias setproxy="export ALL_PROXY=socks5://127.0.0.1:1080"
alias unsetproxy="unset ALL_PROXY"

# add path
# export PATH=$PATH:/home/zds/bin

# change into current directory when quitting ranger
function ranger-cd {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )

    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}
