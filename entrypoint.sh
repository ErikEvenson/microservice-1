#!/bin/bash
set -e

if [ "$1" = 'web' ]; then
  cd /opt/app
  npm start
fi

if [ "$1" = 'test' ]; then
  cd /opt/app
  npm test
fi

if [ "$1" = 'dev' ]; then
  cd /opt/app
  nodemon -e js,sh -x "npm install && npm start"
fi

exec "$@"