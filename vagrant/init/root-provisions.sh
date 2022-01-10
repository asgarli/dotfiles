USERNAME=$1

INIT_SCRIPTS_PATH="/init-scripts"

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y
apt-get install -y unattended-upgrades build-essential vim neovim mc git htop zsh gnupg tmux python3-pygments

# Add new system user
adduser --disabled-password --gecos "" $USERNAME
# Add the user to sudoers file
# usermod -a -G sudo $USERNAME
echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
# Change default shell to ZSH
chsh -s /bin/zsh $USERNAME

# Configure SSH login
mkdir /home/$USERNAME/.ssh
cp $INIT_SCRIPTS_PATH/authorized_keys /home/$USERNAME/.ssh/authorized_keys
chmod 700 /home/$USERNAME/.ssh
chmod 600 /home/$USERNAME/.ssh/authorized_keys        
chown -R $USERNAME /home/$USERNAME/.ssh

# Prevent https://github.com/gatsbyjs/gatsby/issues/11406
echo fs.inotify.max_user_watches=524288 | tee -a /etc/sysctl.conf && sysctl -p