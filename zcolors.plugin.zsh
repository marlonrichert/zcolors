#!/bin/zsh
zcolors.plugin() {
  emulate -L zsh; setopt extendedglob warncreateglobal

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

  autoload -Uz add-zsh-hook
  add-zsh-hook precmd .zcolors.precmd
  .zcolors.precmd() {
    add-zsh-hook -d precmd .zcolors.precmd
    unfunction .zcolors.precmd
    zmodload -F zsh/parameter p:saliases
    ls_colors+=( '*.'${(@k)^saliases}=${${$( lscolor sg )#$'\e['}%m} )
  }
}

{
  zcolors.plugin "$@"
} always {
  unfunction zcolors.plugin
}
