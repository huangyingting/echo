FROM openresty/openresty:1.21.4.1-3-alpine-apk-amd64
ADD nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
RUN apk --no-cache add curl && \
    chgrp -R 0 /usr/local/openresty/nginx/ && \
    chmod -R g=u /usr/local/openresty/nginx/
EXPOSE 8080

