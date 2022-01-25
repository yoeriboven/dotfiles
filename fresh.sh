#!/bin/sh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

#echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
#eval "$(/opt/homebrew/bin/brew shellenv)"

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Set default MySQL root password and auth type.
# mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Install Pickle
sudo wget https://github.com/FriendsOfPHP/pickle/releases/latest/download/pickle.phar -O /usr/local/bin/pickle
sudo chmod +x /usr/local/bin/pickle

# Install PHP extensions with PECL
pickle install redis

# Install global Composer packages
composer global require laravel/installer laravel/valet friendsofphp/php-cs-fixer

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

# Create a Sites directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
mkdir $HOME/Sites

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

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
