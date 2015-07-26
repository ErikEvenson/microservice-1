#!/bin/bash

chmod +x /entrypoint.sh
npm install -g nodemon@1.3.8

cd /opt/app
npm install
