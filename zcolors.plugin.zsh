#!/bin/zsh
() {
  emulate -L zsh; setopt extendedglob warncreateglobal

  local fdir=${${(%):-%x}:h}/functions
  typeset -gU fpath=( $fdir $fpath )
  autoload -Uz $fdir/*~*.zwc

  typeset -g zle_highlight=(
    isearch:fg=0,bg=11  # black on bright yellow
    paste:none
    region:bg=12        # bright blue
    special:fg=14,bold  # bright cyan
    suffix:bg=12        # bright blue
  )
}
