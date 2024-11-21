# install nightly rust
rustup toolchain install $OS_CHECKER_RUST_TOOLCHAIN --allow-downgrade --profile minimal --component clippy,rustfmt

rustc -vV

cargo rudra --help
cargo mirai --help
cargo rap --help
cargo lockbud --help
cargo audit --version
cargo outdated --version
cargo geiger --version
