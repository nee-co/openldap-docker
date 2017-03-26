FROM alpine:latest

ARG depends="openldap"

WORKDIR /opt/openldap

RUN apk add --no-cache $depends\
 && slaptest -f /etc/openldap/slapd.conf -F /opt/openldap

ADD docker-entrypoint.sh /usr/local/bin

ENTRYPOINT ["docker-entrypoint.sh"]

CMD slapd -F /opt/openldap -d 1

EXPOSE 389 636
