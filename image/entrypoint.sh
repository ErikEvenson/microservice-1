#!/bin/bash
set -e

if [ "$1" = 'web' ]; then
  /usr/bin/node /var/www/app.js
fi

exec "$@"