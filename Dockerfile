FROM zjpzjp/mirai:latest
COPY . /ci
WORKDIR /ci
RUN bash -l mirai.sh
