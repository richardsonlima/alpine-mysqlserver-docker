FROM alpine:latest
MAINTAINER Richardson Lima <contato@richardsonlima.com.br>

WORKDIR /db
VOLUME /db
COPY startup.sh /startup.sh

RUN apk add --update mysql mysql-client && rm -f /var/cache/apk/*
COPY my.cnf /etc/mysql/my.cnf

EXPOSE 3306
CMD ["chmod +x /startup.sh"]
CMD ["/startup.sh"]
