## Manual
- [clone dotfiles]
- Disable natural scrolling
- Enable tap to click
- Finder sidebar: Desktop, Home, Apps, Documents, Downloads, Sites
- Install Warp
- Instal Sublime Text
- Symlink global `.gitignore`
```
ln -s ~/.dotfiles/.gitignore_global ~/.gitignore_global 
git config --global core.excludesfile ~/.gitignore_global
```
- Symlink `.zshrc`
```
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
```
- Install Herd
- Run `composer global require beyondcode/expose spatie/global-ray`
- Return `.ssh` and run `chmod 400 ~/.ssh/id_rsa` or `chmod 600 ~/.ssh/id_rsa` if necessary