export FZF_DEFAULT_OPTS='--reverse --border'
export FZF_DEFAULT_COMMAND='fd -t f'
export FZF_COMPLETION_TRIGGER='\'
export FZF_TMUX=1
export FZF_TMUX_HEIGHT='40%'
export fzf_preview_cmd='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'

unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}

# fh - repeat history
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

# fda - including hidden directories
fdir() {
  local dir
  dir=$(fd -t d 2> /dev/null | fzf +m) && cd "$dir"
}

ff() {
  local file
  file=$(fd -t f 2>/dev/null | fzf +m) && nvim "$file"
}

fenv() {
  local out
  out=$(env | fzf)
  echo $(echo $out | cut -d= -f2)
}

function fman(){
  MAN="/usr/bin/man"
  if [ -n "$1" ]; then
	  $MAN "$@"
	  return $?
  else
	  $MAN -k . | fzf --reverse --preview="echo {1,2} | sed 's/ (/./' | sed -E 's/\)\s*$//' | xargs $MAN" | awk '{print $1 "." $2}' | tr -d '()' | xargs -r $MAN
	  return $?
  fi
}
