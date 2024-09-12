FROM zjpzjp/mirai:latest
COPY . /ci
WORKDIR /ci
CMD ["bash", "-l", "mirai.sh"]
