FROM debian:buster-slim
MAINTAINER graboskyc

ENV TZ="America/New_York"
WORKDIR /tmp

RUN apt update \
    && apt install -y busybox \
    && apt install -y libgssapi-krb5-2 libk5crypto3 libkeyutils1 libkrb5-3 libkrb5support0 libssl1.1

RUN ln -s /bin/busybox /bin/wget

RUN wget https://downloads.mongodb.com/compass/mongodb-mongosh_1.1.2_amd64.deb \
    && dpkg -i mongodb-mongosh_1.1.2_amd64.deb \
    && rm mongodb-mongosh_1.1.2_amd64.deb
RUN wget https://fastdl.mongodb.org/mongocli/mongocli_1.20.4_linux_x86_64.deb \
    && dpkg -i mongocli_1.20.4_linux_x86_64.deb \
    && rm mongocli_1.20.4_linux_x86_64.deb
RUN wget https://fastdl.mongodb.org/tools/db/mongodb-database-tools-debian10-x86_64-100.5.1.tgz \
    && tar xvzf mongodb-database-tools-debian10-x86_64-100.5.1.tgz \
    && mv mongodb-database-tools-debian10-x86_64-100.5.1/bin/* /bin/ \
    && rm -rf mongo*

RUN rm -rf /tmp/*

CMD ["/bin/bash", "-l", "-c" ]