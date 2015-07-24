FROM node:0.12.7-slim

MAINTAINER Erik Evenson (erik.e.evenson@gmail.com)

RUN mkdir /var/www
COPY src/app.js /var/www/app.js
COPY src/entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

CMD ["node", "/var/www/app.js"]

EXPOSE 80
