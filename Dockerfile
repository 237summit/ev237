FROM ubuntu:18.04
LABEL maintainer="NGINX Front-end container <seongmi.lee@gmail.com>"

RUN apt-get update &&\
    apt-get install -y mysql-client nginx

COPY html /usr/share/nginx/html
COPY conf.d/* /etc/nginx/conf.d/

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
