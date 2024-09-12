FROM zjpzjp/mirai:latest
COPY . /ci
WORKDIR /ci
CMD ["./mirai.sh"]
