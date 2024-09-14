git clone https://github.com/Byte-OS/polyhal.git
cd polyhal

# time MIRAI_FLAGS="--diag=paranoid" cargo +nightly-2023-12-30 mirai
#
# cargo clean
time MIRAI_FLAGS="--diag=default" cargo +nightly-2023-12-30 mirai

# cargo clean
# echo "--diag=paranoid"
# time MIRAI_FLAGS="--statistics --diag=paranoid" cargo +nightly-2023-12-30 mirai
# cargo clean
# echo "--diag=library"
# time MIRAI_FLAGS="--statistics --diag=library" cargo +nightly-2023-12-30 mirai
# cargo clean
# echo "--diag=verify"
# time MIRAI_FLAGS="--statistics --diag=verify" cargo +nightly-2023-12-30 mirai
# cargo clean
# echo "--diag=default"
# time MIRAI_FLAGS="--statistics --diag=default" cargo +nightly-2023-12-30 mirai

rustup +nightly-2023-12-30 target add riscv64gc-unknown-none-elf
cargo clean
time MIRAI_FLAGS="--diag=default" cargo +nightly-2023-12-30 mirai --target riscv64gc-unknown-none-elf
