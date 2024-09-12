FROM zjpzjp/mirai:latest
COPY . /ci
RUN ["bash", "mirai.sh"]
