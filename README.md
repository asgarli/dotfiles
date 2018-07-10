# My dotfiles

### Setup

```sh
curl -O https://raw.githubusercontent.com/asgarli/dotfiles/master/.vimrc
curl -O https://raw.githubusercontent.com/asgarli/dotfiles/master/.screenrc
```

### System setup 

Update system and install system tools
```sh
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install git mc htop vim python3
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
 - Modify `.zshrc` and set `ZSH_THEME="agnoster"`
 - Add following plugins:
     ```
     plugins=(
      alias-tips
      common-aliases
      colorize
      extract
      fasd
      history
      git
      github
      ng
      npm
      screen
      vscode
      yarn
      zsh-autosuggestions
    )
    ```

