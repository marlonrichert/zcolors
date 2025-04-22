
# 🌈 Z Colors

Use your Gnu `$LS_COLORS` to generate a coherent theme for `git`, `less`, `grep`, and your Zsh
prompt, completions and syntax highlighting. Don't know how to or don't feel like customizing your colors?
No worries: Z Colors comes with an excellent default theme, too.

Once you've [installed](#installation) Z Colors, then your theme is automatically applied to `git`,
`less`, `grep`, and Zsh completions and [syntax highlighting](#requirements). No other steps are
required. (For using Z Colors in your prompt, [see below](#prompt-colors).)

> Do you enjoy using this software? Then please consider to [become a
> sponsor](https://github.com/sponsors/marlonrichert). 💝


## Requirements

If you use `$LS_COLORS`, then the values for `di`, `ln`, `so`, `pi`, `ex`, `bd`, `cd`, `su`, `sg`,
`tw` and `ow` need to contain 3- or 4-bit colors only.  8- and 24-bit colors are currently _not_
supported!

Completion highlighting requires Zsh's ["new" completion
system](https://zsh.sourceforge.io/Doc/Release/Completion-System.html).

Syntax highlighting requires
[`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting).


## Installation

1.  Open a terminal.

1.  Run:
    ```sh
    cd ~/Repos  # or wherever you keep your Git repos/Zsh plugins
    git clone https://github.com/marlonrichert/zcolors.git
    ```

1.  Complete the steps for [customizing your theme](#customizing-your-theme).

1.  Add to your `~/.zshrc` file:
    ```sh
    source ~/Repos/zcolors/zcolors.plugin.zsh
    source ${$XDG_CACHE_HOME:=~/.cache}/zcolors
    ```

Then start a new terminal or shell to enjoy your theme.


## Customizing your theme

Whenever you want make changes to your theme, do the following:

1.  In your terminal, set `$LS_COLORS` to your desired value.

1.  Run:
    ```sh
    autoload -Uz ~/Repos/zcolors/functions/zcolors
    zcolors ${(q+)LS_COLORS} >| ${$XDG_CACHE_HOME:=~/.cache}/zcolors
    ```

Then start a new terminal or shell to enjoy your new theme.


## Updating

1.  Open a terminal and run `git -C ~/Repos/zcolors pull`.
1.  Complete the steps for [customizing your theme](#customizing-your-theme).


# Prompt colors

For adding colors to your prompt, Z Colors provides an associative array `$zcolor` containing the
theme values for file types `di`, `ln`, `so`, `pi`, `ex`, `bd`, `cd`, `su`, `sg`, `tw` and `ow`.
Here's an example of how to use it:
```sh
# $'...': string with support for `print` escape codes
# %{<esc>%}: Tell the prompt that <esc> is zero-width output.
# %{\e[m%}: Reset all colors and other highlighting.
# %~: present working dir
# %#: `%` for normal user, `#` for root
PS1=$'%{\e['$zcolor[di]$'m%}%~%{\e[m%}/ %# '
```
