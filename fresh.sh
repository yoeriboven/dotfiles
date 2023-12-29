#!/bin/sh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
#if test ! $(which omz); then
#  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
#fi

echo 'Installing Homebrew'
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew update

echo 'Installing Brewfile dependencies'
brew tap homebrew/bundle
brew bundle

# Set default MySQL root password and auth type.
# mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Install Pickle
#sudo wget https://github.com/FriendsOfPHP/pickle/releases/latest/download/pickle.phar -O /usr/local/bin/pickle
#sudo chmod +x /usr/local/bin/pickle

# Install PHP extensions with PECL
#pickle install redis

# Install global Composer packages


echo 'Symlinking global .gitignore'
ln -s ~/.dotfiles/.gitignore_global ~/.gitignore_global 
git config --global core.excludesfile ~/.gitignore_global

# Install Laravel Valet
#$HOME/.composer/vendor/bin/valet install

# Create a Sites directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
mkdir $HOME/Sites

echo 'Symlinking .zshrc'
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

echo 'Installing nvm, node and npm'
git clone https://github.com/lukechilds/zsh-nvm.git ~/.zsh-nvm
source $HOME/.zsh-nvm/zsh-nvm.plugin.zsh
nvm install --lts



echo 'Finished setting up your mac!'
echo ''
echo ''
echo 'Open Laravel Herd to install composer. Then run this command:'
echo ''
echo 'composer global require laravel/installer beyondcode/expose spatie/global-ray'


# Installs Hyper plugins
hyper install hyper-snazzy

# Installs zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Removes .phpcsfixer from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.phpcsfixer
ln -s $HOME/.dotfiles/.phpcsfixer $HOME/.phpcsfixer

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Start Redis
brew services restart redis

# necessary?
# Create a directory for global packages and tell npm where to store globally installed packages
#mkdir "${HOME}/.npm-packages"
#npm config set prefix "${HOME}/.npm-packages"

# Set macOS preferences
# We will run this last because this will reload the shell
# source .macos


