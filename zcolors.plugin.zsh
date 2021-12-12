#!/bin/zsh
zcolors.plugin() {
  emulate -L zsh; setopt extendedglob warncreateglobal
  autoload -Uz add-zsh-hook

  autoload -Uz ${${(%):-%x}:P:h}/functions/*~*.zwc

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

  .zcolors.precmd() {
    add-zsh-hook -d precmd .zcolors.precmd
    unfunction .zcolors.precmd
    zmodload -F zsh/parameter p:saliases
    typeset -g ls_colors=( $ls_colors[@] '*.'${(@k)^saliases}=${${$( lscolor sg )#$'\e['}%m} )
  }
  add-zsh-hook precmd .zcolors.precmd
}

{
  zcolors.plugin "$@"
} always {
  unfunction zcolors.plugin
}
