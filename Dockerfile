FROM zjpzjp/mirai:latest
COPY . /ci
WORKDIR /ci
CMD ["bash", "-lc", "mirai.sh"]
