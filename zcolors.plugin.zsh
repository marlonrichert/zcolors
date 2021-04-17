#!/bin/zsh
() {
  emulate -L zsh; setopt extendedglob warncreateglobal

  autoload -Uz ${${(%):-%x}:h}/functions/*~*.zwc

  typeset -g zle_highlight=(
    isearch:fg=0,bg=11  # black on bright yellow
    paste:none
    region:bg=12        # bright blue
    special:fg=14,bold  # bright cyan
    suffix:bg=12        # bright blue
  )
}
