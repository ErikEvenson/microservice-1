FROM node:0.12.7-slim

MAINTAINER Erik Evenson (erik.e.evenson@gmail.com)

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json /usr/src/app/
RUN npm install
COPY . /usr/src/app

COPY entrypoint.sh /
COPY srccopy.sh /etc/init.d/srccopy.sh
RUN chmod +x /etc/init.d/srccopy.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD [ "npm", "start" ]

EXPOSE 80
