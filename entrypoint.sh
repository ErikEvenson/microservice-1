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

exec "$@"