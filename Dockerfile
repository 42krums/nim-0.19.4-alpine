FROM alpine:latest
ENV PATH $PATH:/nim/bin
WORKDIR /nim
RUN apk --no-cache add gcc libc-dev && \
    wget https://nim-lang.org/download/nim-0.19.4.tar.xz && \
    tar x -Jvf nim-0.19.4.tar.xz -C /nim --strip=1 && \
    sh build.sh && \
    bin/nim c koch && \
    ./koch tools && \
    nimble refresh