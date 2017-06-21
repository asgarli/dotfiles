# My dotfiles

### Download

```
curl -O https://raw.githubusercontent.com/asgarli/dotfiles/master/.vimrc \
-O https://raw.githubusercontent.com/asgarli/dotfiles/master/.bash_aliases \
-O https://raw.githubusercontent.com/asgarli/dotfiles/master/.bash_customize \
-O https://raw.githubusercontent.com/asgarli/dotfiles/master/.bash_customize \
-O https://raw.githubusercontent.com/asgarli/dotfiles/master/.screenrc \
```

### bash

Add the following to the end of .bashrc to enable customizations:
```
if [ -f ~/.bash_customize ]; then
    . ~/.bash_customize
fi
```
