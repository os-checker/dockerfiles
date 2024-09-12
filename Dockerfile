FROM zjpzjp/mirai:latest
COPY . /ci
WORKDIR /ci
CMD ["bash", "-lc", "bash mirai.sh"]
