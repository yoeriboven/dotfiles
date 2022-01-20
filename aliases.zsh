# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reloadshell="source $HOME/.zshrc"
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'
alias zshconfig="subl ~/.zshrc"
alias c="clear"

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

# Laravel
alias a="php artisan"
alias m='php artisan migrate'
alias mf='php artisan migrate:fresh'
alias mfs='php artisan migrate:fresh --seed'

# Redis
alias flush-redis="redis-cli FLUSHALL"
