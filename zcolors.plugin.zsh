#!/bin/zsh
zcolors.plugin() {
  emulate -L zsh
  setopt extendedglob warncreateglobal

  autoload -Uz add-zsh-hook
  autoload -Uz ${${(%):-%x}:P:h}/functions/[[:alpha:]]*~*.zwc

  typeset -g zle_highlight=(
    isearch:fg=black,bg=11  # bright yellow
    paste:bold
    region:bg=blue,fg=15    # bright white
    special:fg=14           # bright cyan
    suffix:bg=blue,fg=15    # bright white
  )

  export GREP_COLOR='30;103'           # black on bright yellow
  export GREP_COLORS="mt=$GREP_COLOR"  # GNU grep >= 3

  if whence -p less > /dev/null && (( ${${=$( less -V )}[2]} >= 581 )); then
    export -T LESS less ' '

    # [S]earch results: blac[k] on bright [Y]ellow
    # [P]rompt: bright [W]hite on [b]lue
    less+=( --use-color '-DSkY$DPWb'  )
  fi

  add-zsh-hook precmd .zcolors.precmd
  .zcolors.precmd() {
    add-zsh-hook -d precmd .zcolors.precmd
    unfunction .zcolors.precmd
    zmodload -F zsh/parameter p:saliases
    ls_colors+=( '*.'${(@k)^saliases}"=$lscolors[sg]" )
  }
}

{
  zcolors.plugin "$@"
} always {
  unfunction zcolors.plugin
}
