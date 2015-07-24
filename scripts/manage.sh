#!/bin/bash
# A management script.
#
# 2012-2015 3E Enterprises, LLC

# Get script directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Load dependencies
# source "$DIR/scripts/bash_utility_functions.sh"

# Set usage string
USAGE=$(cat <<EOF
Usage: ${0##*/} test
or: ${0##*/} TBD
EOF
)

# Grab the command and shift the positional parameters.
COMMAND=${1:-$_NULL}
shift

# Set script parameters
# Switch between various management commands
case $COMMAND in
  build)
    docker build -t eevenson/microservice-1:dev image/.
    exit
    ;;
  delete_all)
    ./scripts/manage.sh delete_all_containers && ./scripts/manage.sh delete_all_images
    exit
    ;;
  delete_all_containers)
    docker rm `docker ps --no-trunc -aq`
    exit
    ;;
  delete_all_images)
    docker rmi $(docker images -q)
    exit
    ;;
  dev)
    docker run -d -p 80:80 --volume=/vagrant/microservice-1/image:/usr/src/app eevenson/microservice-1:dev
    exit
    ;;
  run)
    exit
    ;;
  test)
    echo "BOO!"
    exit
    ;;
  # test)
  #   source "$DIR/functions/test/test_environment.sh"
  #   test_environment
  #   exit
  #   ;;
  * | $_NULL)
    echo -e "$USAGE"
    exit 1
    ;;
esac
