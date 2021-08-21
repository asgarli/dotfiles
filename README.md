# Dotfiles

### Setup

```sh
curl -O https://raw.githubusercontent.com/asgarli/dotfiles/master/.vimrc
curl -O https://raw.githubusercontent.com/asgarli/dotfiles/master/.tmux.conf
```

### System setup 

Update system and install system tools
```sh
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install git mc htop vim tmux
```

### zsh setup

 - Install [ohmyzsh.sh](https://ohmyz.sh/).
     ```sh
     sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
     ```
 - Install [`zsh-autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)
     ```
     git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
     ```
 - Install [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting)
     ```
     git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
     ```
 - Modify `.zshrc` and set `ZSH_THEME="agnoster"`
 - Add following plugins:
     ```
     plugins=(
      common-aliases
      colorize
      fasd
      history
      git
      zsh-autosuggestions
      zsh-syntax-highlighting
    )
    ```

