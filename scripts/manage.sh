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
    docker build -t eevenson/microservice-1 image/.
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
