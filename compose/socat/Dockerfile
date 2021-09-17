FROM alpine:latest

RUN apk add --no-cache bash socat

WORKDIR /
USER root
ENV SLAVE_INTERFACE /dev2/ttySlave01
ENV MASTER_INTERFACE /dev2/ttyMaster01
ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]