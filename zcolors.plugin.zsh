#!/bin/zsh
zcolors.plugin() {
  emulate -L zsh; setopt extendedglob warncreateglobal
  autoload -Uz add-zsh-hook

  autoload -Uz ${${(%):-%x}:P:h}/functions/[[:alpha:]]*~*.zwc

  typeset -g zle_highlight=(
    isearch:fg=black,bg=11  # bright yellow
    special:fg=14           # bright cyan
    paste:bold
    region:bg=blue,fg=15    # bright white
    suffix:bg=blue,fg=15    # bright white
  )

  export GREP_COLOR='30;103'  # black on bright yellow

  if command -v less > /dev/null && (( ${${=$( less -V )}[2]} >= 581 )); then
    # -D configures colors.
    # S = search results
    # P = prompt at the bottom of the screen
    # First letter is foreground, second letter is background.
    # $ separates multiple instance of the same flag.
    export -TU LESS less ' '
    less+=( --use-color '-DSkY$DPWb'  )
  fi

  add-zsh-hook precmd .zcolors.precmd
  .zcolors.precmd() {
    add-zsh-hook -d precmd .zcolors.precmd
    unfunction .zcolors.precmd
    zmodload -F zsh/parameter p:saliases
    typeset -g ls_colors=( $ls_colors[@] '*.'${(@k)^saliases}=${${$( lscolor sg )#$'\e['}%m} )
  }
}

{
  zcolors.plugin "$@"
} always {
  unfunction zcolors.plugin
}
