# install nightly rust
rustup toolchain install $OS_CHECKER_RUST_TOOLCHAIN --allow-downgrade --profile minimal --component clippy,rustfmt

rustc -vV

cargo +nightly-2021-10-20 rudra --help
cargo +nightly-2024-02-04 mirai --help
cargo +nightly-2024-10-04 lockbud --help
cargo +nightly-2024-10-11 rap --help
cargo audit --version
cargo outdated --version
cargo geiger --version
