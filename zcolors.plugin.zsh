#!/bin/zsh
() {
  emulate -L zsh; setopt extendedglob warncreateglobal

  autoload -Uz ${${(%):-%x}:h}/functions/*~*.zwc

  typeset -g zle_highlight=(
    isearch:fg=black,bg=11  # bright yellow
    special:fg=14           # bright cyan
    paste:bold
    region:bg=blue,fg=15    # bright white
    suffix:bg=blue,fg=15    # bright white
  )
  export GREP_COLOR='30;103'
  if command -v less > /dev/null && (( ${${=$( less -V )}[2]} >= 581 )); then
    export -TU LESS less ' '
    less+=(  --use-color -DSkY )
  fi
}
