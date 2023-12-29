# Create a new directory and enter it
function mkd() {
   mkdir -p "$@" && cd "$@"
}

function db {
    if [ "$1" = "refresh" ]; then
        mysql -uroot -e "drop database $2; create database $2"
    elif [ "$1" = "create" ]; then
        mysql -uroot -e "create database $2"
    elif [ "$1" = "make" ]; then
        mysql -uroot -e "create database $2"
    elif [ "$1" = "drop" ]; then
        mysql -uroot -e "drop database $2"
    elif [ "$1" = "list" ]; then
        mysql -uroot -e "show databases" | perl -p -e's/\|| *//g'
    elif [ "$1" = "list" ]; then
        opendb
    fi
}

function opendb () {
   [ ! -f .env ] && { echo "No .env file found."; exit 1; }

   DB_CONNECTION=$(grep DB_CONNECTION .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)
   DB_HOST=$(grep DB_HOST .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)
   DB_PORT=$(grep DB_PORT .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)
   DB_DATABASE=$(grep DB_DATABASE .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)
   DB_USERNAME=$(grep DB_USERNAME .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)
   DB_PASSWORD=$(grep DB_PASSWORD .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)

   DB_URL="${DB_CONNECTION}://${DB_USERNAME}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_DATABASE}"

   echo "Opening ${DB_URL}"
   open $DB_URL
}

function cleanhorizon {
    flush-redis && mfs && a horizon
}

function redis-reconfigure() {
    INSTALLATION=`readlink -f $(brew --prefix php)/pecl` && \

    echo "Ok to delete pecl folder from new PHP installation directory?" && \

    confirm && \

    # Clean up new installation
    rm -f "$INSTALLATION/pecl" && \

    echo "Ok to force install Redis?" && \

    confirm && \

    # Install Redis
    echo no | pecl install -f redis && \

    # List installed files by Redis
    FILES=$(echo $(pecl list-files redis | tail -n 1)) && \

    # Get the path to the actual .so php extension file
    SOURCE=$(echo "$FILES" | cut -d " " -f2) && \

    # Actual target PHP looks for it
    TARGET=/opt/homebrew/Cellar/php/pecl/redis.so && \

    echo "About to link $SOURCE (new extension) to $TARGET (location PHP looks for extension)" && \

    confirm && \

    # Symlink the installed extension from the wrong to the right location
    mkdir -p $(dirname $TARGET) && \
    ln -nfs $SOURCE $TARGET && \

    echo "You might have to run 'valet restart' to fix the link."
}

function p() {
   if [ -f vendor/bin/pest ]; then
      vendor/bin/pest "$@"
   else
      vendor/bin/phpunit "$@"
   fi
}

function pf() {
   if [ -f vendor/bin/pest ]; then
      vendor/bin/pest --filter "$@"
   else
      vendor/bin/phpunit --filter "$@"
   fi
}
