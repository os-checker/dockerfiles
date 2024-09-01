FROM ubuntu:22.04

RUN apt update && apt install curl -y && \
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y && \
  echo "export CARGO_TERM_COLOR=always" >> ~/.bashrc && \
  ls -alh ~/.bashrc && cat ~/.bashrc

COPY . /os-checker

WORKDIR /os-checker

ENTRYPOINT ["bash", "-c"]
CMD [". ~/.bashrc && rustup --help"]
