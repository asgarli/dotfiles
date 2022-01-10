######################################################################
####
####
#### User provisioning
####
####
######################################################################

INIT_SCRIPTS_PATH="/init-scripts"

export DEBIAN_FRONTEND=noninteractive

######################################################################
###
### Configure global settings
###
######################################################################
sudo timedatectl set-timezone America/New_York

######################################################################
###
### Configure Git
###
######################################################################
git config --global git.rebase true
git config --global user.name #{NAME}
git config --global user.email #{EMAIL} 
git config --global alias.tree "log --graph --decorate --pretty=oneline --abbrev-commit"  

######################################################################
###
### Install and configure Oh My ZSH
###
######################################################################

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions       

# Install zsh-syntax-highlighting 
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Configure plugins by substituting `plugins` config
sed -i 's/plugins=(git)/plugins=(common-aliases colorize git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc

# Change theme
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc

######################################################################
###
### Install Node 
###
######################################################################
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# Fix permission issue
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo "" >> ~/.zshrc
echo "export PATH=~/.npm-global/bin:\$PATH" >> ~/.zshrc

######################################################################
###
### Configure vim: install vim-plug and copy configuration 
###
######################################################################
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp $INIT_SCRIPTS_PATH/.vimrc ~/.vimrc

# Run Vim plugin install silently
vim +'PlugInstall --sync' +qa


