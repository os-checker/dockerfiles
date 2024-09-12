FROM zjpzjp/mirai:latest
COPY . /ci
WORKDIR /ci
RUN cat ~/.bashrc && ls -alh && bash -l mirai.sh
