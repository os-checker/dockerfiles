FROM zjpzjp/mirai:latest
COPY . /ci
WORKDIR /ci
RUN ["bash", "mirai.sh"]
