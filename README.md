# 🌈 Z Colors
Use your `$LS_COLORS` to generate a coherent theme for Git and your Zsh prompt, completions and
command line.

* [Installation](#installation)
* [Usage](#usage)
    * [Prompt](#prompt)
    * [Command Line](#command-line)
    * [Git](#git)

![screen shot](screenshot.png)

## Installation
Using [Znap](https://github.com/marlonrichert/zsh-snap) **(recommended)**:
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
1.  On the command line, do:
    ```zsh
    % cd ~/git  # or wherever you keep your Git repos/Zsh plugins
    % git clone https://github.com/marlonrichert/zcolors.git
    % autoload -Uz ~/git/zcolors/functions/zcolors
    % zcolors $LS_COLORS >| ~/zcolors.zsh
    ```
1.  In your `~/.zshrc` file, add:
    ```zsh
    source ~/git/zcolors/zcolors.plugin.zsh
    source ~/zcolors.zsh  # generated in step 1
    ```
1.  To update, do:
    ```zsh
    % cd ~/git/zcolors
    % git pull
    ```
1.  Whenever you change your `$LS_COLORS`, do:
    ```zsh
    % zcolors $LS_COLORS >| ~/zcolors.zsh
    ```

## Usage
Once you've installed Z Colors with the steps above, then your `$LS_COLORS` are automatically used
for your Zsh completions. No other steps are required for this.

### Prompt
Z Colors provides a function `lscolor` that can output the colors of `di`, `ln`, `so`, `pi`, `ex`,
`bd`, `cd`, `su`, `sg`, `tw` and `ow`. You can use it in your prompt as follows:
```zsh
# di: dir color
# %{...%}: zero-width output
# %~: present working dir
# %f: reset Foreground color;  %k: reset bacKground color
# %b: reset other formatting
PS1="%{$(lscolor di)}%~%b%f%k> "
```

### Command Line
For your `$LS_COLORS` to be used in your command line, you will need to also install
[`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting).

### Git
Your `$LS_COLORS` are used automatically in Git, too. **_However,_** Git supports only the 16 basic
terminal colors. If any of `di`, `ln`, `so`, `pi`, `ex`, `bd`, `cd`, `su`, `sg`, `tw` or `ow` use
higher order colors, you will need to replace these.
