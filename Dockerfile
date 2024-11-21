# based on Ubuntu and node image
FROM node:22

# install
RUN apt update && \
  apt install git libz3-dev curl wget gh gcc pkg-config libssl-dev clang cmake -y

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y && \
  echo "export CARGO_TERM_COLOR=always" >> ~/.bashrc

COPY os-checker.sh /check/os-checker.sh

WORKDIR /check

ENTRYPOINT ["bash", "-l", "-c"]
CMD ["os-checker.sh"]
