FROM zjpzjp/mirai:latest
COPY . /ci
WORKDIR /ci
CMD bash mirai.sh
