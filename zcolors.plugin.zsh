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
  export -TU LESS="$LESS --use-color -DSkY" less ' '
  export -TU GREP_OPTIONS="$GREP_OPTIONS --color=auto" grep_options ' '
  export GREP_COLOR='30;103'
}
