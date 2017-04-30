FROM alpine:3.5

MAINTAINER Dan Porter <dpreid@gmail.com>

ENV SNIPROXY_VERSION=0.5.0 \
    SNIPROXY_SHASUM="0b8dd06f9aa9e1c4151b572caf645ffceacdd35a139ded16a7fb0035452c17e5"

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
