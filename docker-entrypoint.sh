#!/bin/sh

cat /etc/openldap/slapd.ldif\
    | sed -r "s/^olcModuleload/#olcModuleload/"\
    | sed -r "s/(olcSuffix).*/\1: "$OPENLDAP_SUFFIX"/"\
    | sed -r "s/(olcRootDN).*/\1: "$OPENLDAP_ROOT_DN"/"\
    | sed -r "s/(olcRootPW).*/\1: "$OPENLDAP_ROOT_PASSWORD"/"\
    | slapadd -F . -n 0

exec "$@"
