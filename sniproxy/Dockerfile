FROM alpine:3.15

MAINTAINER Dan Porter <dpreid@gmail.com>

ENV SNIPROXY_VERSION="822bb80df9b7b345cc9eba55df74a07b498819ba" \
    SNIPROXY_SHASUM="e8701d9a722155810b23c6363b3d8bf6e55734576c1d4c49e3d1542099c898eb"

RUN apk --no-cache --virtual build-dependencies add \
        libressl \
        autoconf \
        automake \
        build-base \
        gettext-dev \
        libev-dev \
        pcre-dev \
        udns-dev \
        bsd-compat-headers \
    && mkdir -p /tmp/build \
    && wget -O /tmp/build/${SNIPROXY_VERSION}.tar.gz https://codeload.github.com/dlundquist/sniproxy/tar.gz/${SNIPROXY_VERSION} \
    && echo "${SNIPROXY_SHASUM}  /tmp/build/${SNIPROXY_VERSION}.tar.gz" | sha256sum -c \
    && tar -xzf /tmp/build/${SNIPROXY_VERSION}.tar.gz -C /tmp/build/ \
    && cd /tmp/build/sniproxy-${SNIPROXY_VERSION} \
    && ./autogen.sh \
    && ./configure \
    && make install \
    && cd / \
    && rm -rf /tmp/build \
    && apk --no-cache add \
        libev \
        pcre \
        udns \
    && apk --no-cache --purge del build-dependencies

COPY sniproxy.conf /etc/sniproxy.conf
COPY docker-entrypoint.sh /

EXPOSE 443

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["sniproxy", "-f"]
