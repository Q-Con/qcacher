FROM alpine:3.3
MAINTAINER Dan Porter <dpreid@gmail.com>

RUN apk add --update unbound; \
    rm -rf /var/cache/apk/*;

COPY root.hints /var/unbound/etc/root.hints  
COPY root.key /var/unbound/etc/root.key
COPY unbound.conf /etc/unbound/unbound.conf
COPY qcacher.conf /etc/unbound/qcacher.conf
COPY docker-entrypoint.sh /

RUN unbound-checkconf

EXPOSE 53/udp

ENTRYPOINT ["/docker-entrypoint.sh"]
