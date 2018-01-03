#name of container: dashticz
#versison of container: 0.1.0
FROM alpine:latest

RUN apk add --no-cache nginx git
RUN mkdir -p /var/www && cd /var/www && git clone https://github.com/robgeerts/dashticz_v2 --depth=1 dashticz
RUN mkdir -p /tmp && echo "cd /var/www/dashticz && git pull && cp -R * /usr/share/nginx/html" > /tmp/start.sh

ENTRYPOINT ["/bin/sh", "/tmp/start.sh"]
