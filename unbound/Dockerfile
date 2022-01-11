FROM alpine:3.15
MAINTAINER Dan Porter <dpreid@gmail.com>

RUN apk add --update unbound && \
    chown unbound:unbound /etc/unbound && \
    rm -rf /var/cache/apk/*

COPY --chown=unbound:unbound etc/* /etc/unbound/
COPY docker-entrypoint.sh /

RUN unbound-checkconf

EXPOSE 53/udp

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD unbound
