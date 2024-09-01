FROM ubuntu:22.04

RUN apt update && apt install -yq curl &> /dev/null && \
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y && \
  echo "export CARGO_TERM_COLOR=always" >> ~/.bashrc

COPY . /os-checker

WORKDIR /os-checker

ENTRYPOINT ["bash", "-l", "-c"]
CMD ["rustup --help"]
