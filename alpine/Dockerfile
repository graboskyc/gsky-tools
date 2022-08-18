FROM node:alpine as build
WORKDIR /tmp
# build mongosh for alpine
RUN apk add git python3 make g++ cmake openssl openssl-dev
RUN cd /tmp \
    && git clone https://github.com/mongodb/mongo-c-driver \
    && cd mongo-c-driver \
    && mkdir cmake-build && cd cmake-build \
    && cmake -DENABLE_MONGOC=OFF ../ \
    && make -j8 install
RUN cd /tmp \
    && git clone https://github.com/mongodb/libmongocrypt \
    && cd libmongocrypt \
    && mkdir cmake-build && cd cmake-build \
    && cmake ../ \
    && make


RUN npm install -g lerna typescript
RUN npm install --save mongodb-redact
RUN npm install -g mongodb-client-encryption
RUN cd /tmp \
    && wget https://github.com/mongodb-js/mongosh/archive/refs/tags/v1.1.2.zip \
    && unzip v1.1.2.zip \
    && cd mongosh-1.1.2 \
    && npm run bootstrap \
    && npm run compile-cli \
    && cd /tmp \
    && rm -rf mongo* v1*


####

FROM alpine:latest
WORKDIR /bin
RUN apk add openssl
COPY --from=build /tmp/mongosh-main/ .
CMD ["/bin/bash", "-l", "-c" ]


-DENABLE_SHARED_BSON=ON