FROM cosmomill/alpine-glibc
MAINTAINER graboskyc
ENV TZ="America/New_York"

WORKDIR /tmp

RUN apk update \
    && apk add \
        openssl zstd krb5-libs rpm

RUN cd /tmp \
    && wget https://github.com/mongodb-js/mongosh/releases/download/v1.1.2/mongosh-1.1.2-linux-x64.tgz \
    && tar xvzf mongosh-1.1.2-linux-x64.tgz \
    && mv /tmp/mongosh-1.1.2-linux-x64/bin/* /bin/ \
    && rm -rf /tmp/mongosh*

RUN cd /tmp \
    && wget -O libkeyutils.tar.zst https://www.archlinux.org/packages/core/x86_64/keyutils/download/ \
    && zstd -d libkeyutils.tar.zst \
    && tar xvf libkeyutils.tar \
    && cp /tmp/usr/lib/libkeyutils.so.1.10 /lib/libkeyutils.so.1 \
    && rm -rf /tmp/* 

RUN cd /tmp \
    && wget https://fastdl.mongodb.org/tools/db/mongodb-database-tools-rhel80-x86_64-100.5.1.tgz \
    && tar xvzf mongodb* \
    && mv mongod*/bin/* /bin/ \
    && rm -rf /tmp/*  

RUN cd /tmp \
    && wget https://fastdl.mongodb.org/mongocli/mongocli_1.20.4_linux_x86_64.rpm \
    && rpm -i mongocli* \
    && rm -rf /tmp/*

RUN apk del rpm zstd 

CMD ["/bin/sh", "-l", "-c" ]