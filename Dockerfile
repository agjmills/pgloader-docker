FROM ubuntu:24.04

RUN apt update && apt install -y sbcl unzip libsqlite3-dev gawk curl make freetds-dev libzip-dev

RUN curl -fsSLO https://github.com/dimitri/pgloader/archive/v3.6.9.tar.gz

RUN tar xvf v3.6.9.tar.gz && \
    cd pgloader-3.6.9/ && \
    make pgloader && \
    mv ./build/bin/pgloader /usr/local/bin/ && \
    pgloader --version

ENTRYPOINT /usr/local/bin/pgloader
