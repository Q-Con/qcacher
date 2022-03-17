FROM nginx:alpine
MAINTAINER Dan Porter <dpreid@gmail.com>

COPY config /etc/nginx
COPY docker-entrypoint.sh /

RUN mkdir -p /srv && nginx -t

EXPOSE 80

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["-g", "daemon off;"]
