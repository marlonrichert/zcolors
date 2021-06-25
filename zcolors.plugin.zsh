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
  # Commenting this line as it breaks `less` on MacOS
  # export -TU LESS="$LESS --use-color -DSkY" less ' '
  export GREP_COLOR='30;103'
}
