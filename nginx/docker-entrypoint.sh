#!/bin/sh
set -e

sed -i -e"s/127.0.0.11/`getent hosts qcacher-dns | awk '{ print $1 }'`/" /etc/nginx/includes/resolver

exec nginx -g "daemon off;"
