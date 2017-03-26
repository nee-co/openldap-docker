#!/bin/sh

>> slapd.ldif <<EOF
dn: olcDatabase=mdb,cn=config
objectClass: olcDatabaseConfig
objectClass: olcMdbConfig
olcDatabase: mdb
olcDbMaxSize: 1073741824
olcSuffix: $OPENLDAP_SUFFIX
olcRootDN: $OPENLDAP_ROOT_DN
olcRootPW: $OPENLDAP_ROOT_PASSWORD
olcDbDirectory: /usr/local/var/openldap-data
olcDbIndex: objectClass eq
EOF

slapadd -F ./ -l ./slapd.ldif

exec "$@"
