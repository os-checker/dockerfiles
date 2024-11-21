# install nightly rust
rustup toolchain install $OS_CHECKER_RUST_TOOLCHAIN --allow-downgrade --profile minimal --component clippy,rustfmt

rustup default $OS_CHECKER_RUST_TOOLCHAIN

rustup show

rustc -vV

cargo +nightly-2021-10-21 rudra --help
cargo +nightly-2024-02-05 mirai --help
cargo +nightly-2024-10-05 lockbud --help
cargo +nightly-2024-10-12 rap --help
cargo audit --version
cargo outdated --version
cargo geiger --version
