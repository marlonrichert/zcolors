#!/bin/zsh
() {
  emulate -L zsh; setopt extendedglob warncreateglobal

  local fdir=${${(%):-%x}:A:h}/functions
  typeset -gU fpath=( $fdir $fpath )
  autoload -Uz $fdir/*~*.zwc

  export -a zle_highlight=(
    region:standout
    special:standout
    suffix:standout
    isearch:standout
    paste:none
  )
}
