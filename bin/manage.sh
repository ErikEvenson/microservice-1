#!/bin/bash
# A management script.
#
# 2012-2015 3E Enterprises, LLC

# Get script directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Load dependencies
# source "$DIR/bin/bash_utility_functions.sh"

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
  bash)
    docker exec -it tmp /bin/bash
    exit
    ;;
  build)
    packer build -force packer.json
    exit
    ;;
  delete_all)
    bin/manage.sh delete_all_containers && bin/manage.sh delete_all_images
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
    docker kill tmp
    docker rm tmp
    docker run -d -p 80:80 --name="tmp" -v /vagrant/microservice-1:/opt/app eevenson/microservice-1 /entrypoint.sh dev
    exit
    ;;
  logs)
    docker logs tmp
    exit
    ;;
  run)
    docker kill tmp
    docker rm tmp
    docker run -d -p 80:80 --name="tmp" eevenson/microservice-1 /entrypoint.sh web
    exit
    ;;
  start)
    docker start tmp
    exit
    ;;
  stop)
    docker stop tmp
    exit
    ;;
  test)
    docker kill tmp
    docker rm tmp
    docker run -it --name "tmp" eevenson/microservice-1 /entrypoint.sh test
    exit
    ;;
  * | $_NULL)
    echo -e "$USAGE"
    exit 1
    ;;
esac
