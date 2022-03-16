FROM alpine:3.7

MAINTAINER Dan Porter <dpreid@gmail.com>

ENV SNIPROXY_VERSION=0.6.0 \
    SNIPROXY_SHASUM="d73c77a9fa8199ae7ac551c0332d3e0a3ff234623f53d65369a8fa560d9880e2"

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
    && wget -O /tmp/build/${SNIPROXY_VERSION}.tar.gz https://github.com/dlundquist/sniproxy/archive/${SNIPROXY_VERSION}.tar.gz \
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

EXPOSE 443

CMD ["sniproxy", "-f"]
