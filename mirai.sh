git clone https://github.com/kern-crates/rtc.git
cd rtc

time MIRAI_FLAGS="--diag=paranoid" cargo +nightly-2023-12-30 mirai

cargo clean
time MIRAI_FLAGS="--diag=default" cargo +nightly-2023-12-30 mirai

cargo clean
echo "--diag=paranoid"
time MIRAI_FLAGS="--statistics --diag=paranoid" cargo +nightly-2023-12-30 mirai
cargo clean
echo "--diag=library"
time MIRAI_FLAGS="--statistics --diag=library" cargo +nightly-2023-12-30 mirai
cargo clean
echo "--diag=verify"
time MIRAI_FLAGS="--statistics --diag=verify" cargo +nightly-2023-12-30 mirai
cargo clean
echo "--diag=default"
time MIRAI_FLAGS="--statistics --diag=default" cargo +nightly-2023-12-30 mirai
