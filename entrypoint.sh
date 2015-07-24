#!/bin/bash
set -e

if [ "$1" = 'web' ]; then
  /usr/bin/node /opt/app/app.js
fi

exec "$@"