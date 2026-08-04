
# 🌈 Z Colors

Tools to generate a coherent theme `git`, `less`, `grep`, and your Zsh
prompt, completions and syntax highlighting

Also includes convienences for working with ANSI colors in general.

> Do you enjoy using this software? Then please consider to [become a
> sponsor](https://github.com/sponsors/marlonrichert). 💝


## Requirements

- For completion highlighting: Zsh's ["new" completion
  system](https://zsh.sourceforge.io/Doc/Release/Completion-System.html).
- For command line highlighting:
  [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting).


## Installation

To install, simply clone the repo:
```
git clone https://github.com/marlonrichert/zcolors.git
```


## Usage

Z Colors' main usage is to generate a theme:

1. `cd` into the repo.

1. To generate the default theme, run:
   ```
   zcolors > ~/zshtheme
   ```
   Alternatively, to generate a custom theme based on your GNU `$LS_COLORS`, run:
   ```
   zcolors "$LS_COLORS" > ~/zsh_theme
   ```
   ⚠️ Note:
   - Your `$LS_COLORS` values for `di`, `ln`, `so`, `pi`, `ex`, `bd`, `cd`, `su`, `sg`, `tw` and
     `ow` need to contain 3- or 4-bit colors only. 8- and 24-bit colors are currently _not_
     supported!
   - `zcolors` will generate BSD `$LSCOLORS` for you, but you cannot pass it as input!

1. Add to your `.zshrc` file:
   ```
   source zshtheme
   ```

1. Close your current shell and open a new one.

Repeat these steps whenever you want to update your theme.

Additionally to configuring your theme, doing the above also exposes the following array and
functions.


### `$zcolor
An associative array that contains your theme values for file types `di`, `ln`, `so`, `pi`, `ex`,
`bd`, `cd`, `su`, `sg`, `tw` and `ow`.

Example:
```sh
# $'...': string with support for `print` escape codes
# %{<esc>%}: Tell the prompt that <esc> is zero-width output.
# %{\e[m%}: Reset all colors and other highlighting.
# %~: present working dir
# %#: `%` for normal user, `#` for root
PS1=$'%{\e['$zcolor[di]$'m%}%~%{\e[m%}/ %# '
```

### `color`

Converts a `$color` entry to ANSI and prints it.

Example usage:
```sh
color dim
print 'This text is now dim'
color none
```

### `lscolor`

Prints the ANSI highlighting for a particular file type.

Example usage:
```sh
print 'The current directory is '
lscolor di
print $PWD
color none
```


## Updating

1. `cd` into the repo and run `git pull`.

1. Repeat the steps under [Usage](#usage).


## Author and license
See the [LICENSE file](LICENSE) for more details.
