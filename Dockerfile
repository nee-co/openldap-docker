FROM alpine:latest

ARG depends="openldap"

WORKDIR /opt/openldap

RUN apk add --no-cache $depends

ADD docker-entrypoint.sh /usr/local/bin

ENTRYPOINT ["docker-entrypoint.sh"]

CMD slapd -d 1

EXPOSE 389 636
