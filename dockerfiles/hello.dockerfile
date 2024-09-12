FROM ubuntu:22.04

COPY . /os-checker

WORKDIR /os-checker

ENTRYPOINT ["bash", "-l", "-c"]
CMD ["echo from DockerFile"]
