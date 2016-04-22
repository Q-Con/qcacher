#!/bin/sh
set -e

if [ -n ${DNS_IP+x} ]; then
    # Swap IPs defined in qcacher.conf with the one provided at runtime
    sed -i -e's/\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}/'"${DNS_IP}"'/' /etc/unbound/qcacher.conf && \
        unbound-checkconf
fi

exec unbound
