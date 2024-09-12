FROM zjpzjp/mirai:latest
COPY . /ci
WORKDIR /ci
CMD ["bash", "-lc", "ls -alh && bash mirai.sh"]
