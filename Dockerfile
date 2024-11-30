# based on Ubuntu and node image
FROM node:22

# install
RUN apt update && \
  apt install git libz3-dev curl wget gh gcc pkg-config libssl-dev clang cmake tree -y

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y && \
  echo "export CARGO_TERM_COLOR=always" >> ~/.bashrc

COPY os-checker.sh /os_checker/os-checker.sh
RUN bash -l -c /os_checker/os-checker.sh

WORKDIR /os_checker

ENTRYPOINT ["bash", "-l", "-c"]
# CMD ["./run.sh"]
