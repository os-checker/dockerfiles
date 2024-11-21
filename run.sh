# install nightly rust
rustup toolchain install $OS_CHECKER_RUST_TOOLCHAIN --allow-downgrade --profile minimal --component clippy,rustfmt

rustc -vV
