FROM zjpzjp/mirai:latest
COPY . /ci
WORKDIR /ci
CMD cat ~/.bashrc && ls -alh && bash -l mirai.sh
