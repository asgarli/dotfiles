setopt autocd              # change directory just by typing its name
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern

command -v starship &> /dev/null && eval "$(starship init zsh)"

[ -f ~/.aliases ] && source ~/.aliases

if [[ $OSTYPE == darwin* ]]; then
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
  source /usr/share/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  source /usr/share/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
