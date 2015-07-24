FROM node:0.12.7-slim

MAINTAINER Erik Evenson (erik.e.evenson@gmail.com)
# http://bitjudo.com/blog/2014/03/13/building-efficient-dockerfiles-node-dot-js/
# http://murphyrandle.svbtle.com/vittles-for-developing-nodejs-apps-in-docker

COPY entrypoint.sh /
COPY service.sh /etc/init.d/service.sh
RUN chmod +x /etc/init.d/service.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD [ "npm", "start" ]
EXPOSE 80

COPY package.json /tmp/package.json
RUN cd /tmp && mkdir -p node_modules && npm install
RUN mkdir -p /opt/app && cp -a /tmp/node_modules /opt/app/

WORKDIR /opt/app
ADD . /opt/app
