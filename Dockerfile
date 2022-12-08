FROM openresty/openresty:1.21.4.1-3-alpine-apk-amd64
ARG version=latest
ADD nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
RUN apk --no-cache add curl && \
    chgrp -R 0 /usr/local/openresty/nginx/ && \
    chmod -R g=u /usr/local/openresty/nginx/
ENV VERSION=$version
ENV ENVIRONMENT=
EXPOSE 8080