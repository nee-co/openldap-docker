FROM alpine:latest

ARG depends="openldap"

WORKDIR /opt/openldap

RUN apk add --no-cache $depends

ENV PATH $PATH:/opt/openldap/bin
ENV OPENLDAP_ROOT_DN "cn=admin,dc=example,dc=net"
ENV OPENLDAP_ROOT_PASSWORD "password"
ENV OPENLDAP_SUFFIX "dc=example,dc=net"

ADD docker-entrypoint.sh ./bin/

ENTRYPOINT ["docker-entrypoint.sh"]

CMD slapd -F ./ -d 1

EXPOSE 389 636
