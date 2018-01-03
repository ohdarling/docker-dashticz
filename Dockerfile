#name of container: dashticz
#versison of container: 0.1.0
FROM alpine:latest

RUN apk add --no-cache nginx git
RUN mkdir -p /var/www && cd /var/www && git clone https://github.com/robgeerts/dashticz_v2 --depth=1 dashticz
ADD root /
RUN mkdir -p /tmp && mkdir -p /run/nginx && echo "cd /var/www/dashticz && git pull && nginx && read name" > /tmp/start.sh

EXPOSE 80

ENTRYPOINT ["/bin/sh", "/tmp/start.sh"]
