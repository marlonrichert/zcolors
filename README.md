# 🌈 Z Colors
Use your Gnu `$LS_COLORS` or BSD `$LSCOLORS` to generate a coherent theme for `git`, `less`,
`grep`, and your Zsh prompt, completions and command line.  Don't know how to or don't feel like
customizing your colors?  No worries: Z Colors comes with an excellent default theme, too.

> Enjoy this software? [Become a sponsor!](https://github.com/sponsors/marlonrichert)

![screen shot](screenshot.png)

## Requirements
If you use `$LS_COLORS`, then the values for `di`, `ln`, `so`, `pi`, `ex`, `bd`, `cd`, `su`, `sg`,
`tw` and `ow` need to contain 3- or 4-bit colors only.  8- and 24-bit colors are currently _not_
supported!

For your theme be used to highlight your command line, you will need to also install
[`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting).

## Installation
Using [Znap](https://github.com/marlonrichert/zsh-snap):
1.  In your `~/.zshrc` file, add:
    ```zsh
    znap source marlonrichert/zcolors
    znap eval zcolors "zcolors ${(q)LS_COLORS}"
    ```
1.  To update, do:
    ```zsh
    % znap pull
    ```

Manually:
1.  On the command line:
    ```zsh
    % cd ~/Git  # or wherever you keep your Git repos/Zsh plugins
    % git clone https://github.com/marlonrichert/zcolors.git
    % autoload -Uz ~/Git/zcolors/functions/zcolors
    % mkdir -p ${$XDG_CACHE_HOME:=~/.cache}
    % zcolors ${(q)LS_COLORS} >| ${XDG_CACHE_HOME}/.zcolors
    ```

1.  In your `~/.zshrc` file, add:
    ```zsh
    source ~/Git/zcolors/zcolors.plugin.zsh
    source ~/.zcolors  # generated in step 1
    ```

1.  To update:
    ```zsh
    % git -C ~/Git/zcolors pull
    ```

1.  Whenever you change your `$LS_COLORS`:
    ```zsh
    % zcolors >| ~/.zcolors
    ```



## Usage
Once you've [installed](#installation) Z Colors, then your theme is automatically applied to `git`,
`less`, `grep`, Zsh completions and the Zsh [command line](#requirements). No other steps are
required for these.

For adding colors to your prompt, Z Colors provides an associative array `$zcolor` containing the
theme values for file types `di`, `ln`, `so`, `pi`, `ex`, `bd`, `cd`, `su`, `sg`, `tw` and `ow`.
You can use it like this:
```zsh
# $'...': string with support for `print` escape codes
# %{<esc>%}: Tell the prompt that <esc> is zero-width output.
# %{\e[0m%}: Reset all colors and other highlighting.
# %~: present working dir;  %#: `%` for normal user, `#` for root
PS1=$'%{\e['$zcolor[di]$'m%}%~%{\e[m%}/ %# '
```
