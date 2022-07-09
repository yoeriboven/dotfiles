# Easier navigation: .., ... and ....
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh//id_ed25519.pub"
alias reloadshell="source $HOME/.zshrc"
alias phpstorm='open -a /Applications/PhpStorm.app'
alias zshconfig="subl ~/.zshrc"
alias gitignore="subl ~/.dotfiles/.gitignore_global"
alias aliases="subl ~/.dotfiles/aliases.zsh"
alias functions="subl ~/.dotfiles/functions.zsh"
alias c="clear"
alias l="ls -alh"

alias ph="phpstorm . && github ."

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias sites="cd $HOME/Sites"

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias watch="npm run watch"

# Git
alias commit="git add . && git commit -m"
alias pull="git pull"
alias push="git push"
alias wip="commit wip"
alias gb="git reset --soft HEAD~"

# PHP
alias c="composer"
alias cu="composer update"
alias cr="composer require"
alias ci="composer install"
alias cda="composer dump-autoload -o"
alias cfresh="rm -rf vendor/ composer.lock && composer i"

alias phpunit="vendor/bin/phpunit"
alias p="phpunit"
alias pu="phpunit"
alias pf="phpunit --filter"

alias phpstan="./vendor/bin/phpstan analyse"

# Laravel
alias a="php artisan"
alias m='php artisan migrate'
alias mf='php artisan migrate:fresh'
alias mfs='php artisan migrate:fresh --seed'

# Redis
alias flush-redis="redis-cli FLUSHALL"

# Environment
alias php81="brew unlink php && brew link --overwrite --force php"
alias php73="brew unlink php && brew link --overwrite --force php@7.3"

alias node18="brew unlink node && brew link --overwrite --force node"
alias node14="brew unlink node && brew link --overwrite --force node@14"

alias env-default="node18"
alias env-videoup="node14"
