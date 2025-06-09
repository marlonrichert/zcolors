#!/bin/zsh
zcolors.plugin() {
  emulate -L zsh
  setopt extendedglob warncreateglobal

  autoload -Uz add-zsh-hook
  autoload -Uz ${${(%):-%x}:P:h}/functions/[[:alpha:]]*~*.zwc

  if whence -p less > /dev/null && (( ${${=$( less -V )}[2]} >= 581 )); then
    export -UT LESS less ' '

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
