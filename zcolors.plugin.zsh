#!/bin/zsh
() {
  emulate -L zsh; setopt extendedglob warncreateglobal

  autoload -Uz ${${(%):-%x}:h}/functions/*~*.zwc

  typeset -g zle_highlight=(
    isearch:fg=black,bg=11  # bright yellow
    paste:bold
    region:bg=blue,fg=15    # bright white
    special:fg=14           # bright cyan
    suffix:bg=blue,fg=15    # bright white
  )
}
