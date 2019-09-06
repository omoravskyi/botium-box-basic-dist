FROM node:11.10.1-alpine

RUN apk update && apk add dos2unix bash

WORKDIR /app
COPY . /app
RUN find . -type f -print0 | xargs -0 dos2unix

ENV PHANTOMJS_VERSION 2.1.1

RUN apk --no-cache add curl curl-dev g++ make python alsa-lib-dev krb5 krb5-dev
RUN curl -Ls "https://github.com/dustinblackman/phantomized/releases/download/${PHANTOMJS_VERSION}/dockerized-phantomjs.tar.gz" | tar xz -C / && curl -k -Ls https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2 | tar -jxvf - -C ./ && cp phantomjs-${PHANTOMJS_VERSION}-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs && rm -fR phantomjs-${PHANTOMJS_VERSION}-linux-x86_64
RUN npm set unsafe-perm true && BUILD_ONLY=true npm install --no-optional --production
RUN apk del curl g++ make python

ARG BOTIUMBOX_QUEUE_REDISURL=redis://redisuser:redispassword@redishost:redisport
ARG PRISMA_ENDPOINT=https://my-prisma-endpoint:my-prisma-port/demo/dev
ARG PRISMA_MANAGEMENT_API_SECRET=
ARG PRISMA_SECRET=myprismasecret123
ARG JWT_SECRET=myjwtsecret123

ENV BOTIUMBOX_QUEUE_REDISURL $BOTIUMBOX_QUEUE_REDISURL
ENV PRISMA_ENDPOINT $PRISMA_ENDPOINT
ENV PRISMA_MANAGEMENT_API_SECRET $PRISMA_MANAGEMENT_API_SECRET
ENV PRISMA_SECRET $PRISMA_SECRET
ENV JWT_SECRET $JWT_SECRET

VOLUME /app/server/testsets
VOLUME /app/server/botiumwork
VOLUME /app/server/resources
VOLUME /app/agent/botiumwork
VOLUME /app/agent/resources

EXPOSE 4000

CMD ./wait-for-it.sh -s -t 300 prisma:4466 -- npm start