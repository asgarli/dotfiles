#!/bin/bash

cd ~

DOTFILES=(
  ".bash_aliases"
  ".bash_customize"
  ".screenrc"
  ".vimrc"
)

for dotfile in "${DOTFILES[@]}"
do
  curl -O https://raw.githubusercontent.com/asgarli/dotfiles/master/$dotfile
done

cat <<EOT >> .bashrc
if [ -f ~/.bash_customize ]; then
  . ~/.bash_customize
fi
EOT
