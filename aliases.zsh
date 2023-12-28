# Easier navigation: .., ... and ....
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# SSH
alias sshpp="ssh forge@67.205.143.169"
alias sshvideoup="ssh forge@157.245.142.172"
alias sshmain="ssh forge@68.183.114.122"

# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh//id_ed25519.pub"
alias reloadshell="source $HOME/.zshrc"
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

alias phpstan="./vendor/bin/phpstan analyse"

# Laravel
alias a="php artisan"
alias m='php artisan migrate'
alias mf='php artisan migrate:fresh'
alias mfs='php artisan migrate:fresh --seed'
alias horizon='php artisan horizon'

alias pint="vendor/bin/pint"

alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'

alias minio='minio server /tmp/minio --address :9001'

# Redis
alias flush-redis="redis-cli FLUSHALL"

# Environment
alias php82="brew unlink php && brew link --overwrite --force php@8.2"
alias php81="brew unlink php && brew link --overwrite --force php@8.1"
alias php73="brew unlink php && brew link --overwrite --force php@7.3"

alias node20="brew install node"
alias node14="brew unlink node && brew link --overwrite --force node@14"

alias env-default="brew reinstall node"
alias env-videoup="node14"

# Qbixx VPN Jumpbox
# https://www.reddit.com/r/WireGuard/comments/10a55y8/wireguard_not_working_on_macos_13_ventura/j47g7h6/
alias vpnup="sudo wg-quick up wg0"
alias vpndown="sudo wg-quick down wg0"
