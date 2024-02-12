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

echo 'Symlinking global .gitignore'
ln -s ~/.dotfiles/.gitignore_global ~/.gitignore_global 
git config --global core.excludesfile ~/.gitignore_global

# Create a Sites directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
mkdir $HOME/Sites

echo 'Symlinking .zshrc'
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Laravel Herd also ships with this
#echo 'Installing nvm, node and npm'
#git clone https://github.com/lukechilds/zsh-nvm.git ~/.zsh-nvm
#source $HOME/.zsh-nvm/zsh-nvm.plugin.zsh
#nvm install --lts

# Start mysql
# brew services start mysql

echo 'Finished setting up your mac!'
echo ''
echo ''
echo 'Open Laravel Herd to install composer. Then run this command:'
echo ''
echo 'composer global require laravel/installer beyondcode/expose spatie/global-ray'

