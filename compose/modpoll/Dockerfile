FROM alpine:latest

RUN apk add --no-cache bash curl

RUN curl -o /modpoll.tgz https://www.modbusdriver.com/downloads/modpoll.tgz && \
    tar -xzf /modpoll.tgz && \
    mv /modpoll/x86_64-linux-gnu/modpoll /usr/bin/ && \
    rm /modpoll.tgz

ENTRYPOINT "bash"
