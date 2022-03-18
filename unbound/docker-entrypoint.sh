#!/bin/sh
set -e

if [ -n ${CACHE_IP+x} ]; then
    echo "local-data: \"qcacher IN A ${CACHE_IP}\"" >> /etc/unbound/settings.conf
fi
if [ -n ${CACHE_SUBNET+x} ]; then
    echo "access-control-view: ${CACHE_SUBNET} qcacher" >> /etc/unbound/settings.conf
fi

unbound-checkconf
exec $@
