FROM debian:buster-slim
MAINTAINER graboskyc

ENV TZ="America/New_York"
WORKDIR /tmp

# prereqs and prereq clean up
RUN apt update \
    && apt install -y --no-install-recommends \
    busybox \
    libgssapi-krb5-2 libk5crypto3 libkeyutils1 libkrb5-3 libkrb5support0 libssl1.1 \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt \
    && ln -s /bin/busybox /bin/wget

# mongodb tools
RUN wget https://downloads.mongodb.com/compass/mongodb-mongosh_1.1.2_amd64.deb \
    https://fastdl.mongodb.org/mongocli/mongocli_1.20.4_linux_x86_64.deb \
    https://fastdl.mongodb.org/tools/db/mongodb-database-tools-debian10-x86_64-100.5.1.tgz \
    && dpkg -i *.deb \
    && tar xvzf mongodb-database-tools-debian10-x86_64-100.5.1.tgz \
    && mv mongodb-database-tools-debian10-x86_64-100.5.1/bin/* /bin/ \
    && rm -rf mongo*

CMD ["/bin/bash", "-l", "-c" ]