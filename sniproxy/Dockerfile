FROM ubuntu:trusty
MAINTAINER Dan Porter <dpreid@gmail.com>

RUN set -x && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ED122FA0 && \
    echo "deb http://ppa.launchpad.net/dlundquist/sniproxy/ubuntu trusty main" >> /etc/apt/sources.list && \
    apt-get update && apt-get install -y --no-install-recommends \
        sniproxy && \
    rm -rf /var/lib/apt/lists/*

COPY sniproxy.conf /etc/sniproxy/sniproxy.conf

EXPOSE 443

CMD ["/usr/sbin/sniproxy", "-f", "-c", "/etc/sniproxy/sniproxy.conf"]
