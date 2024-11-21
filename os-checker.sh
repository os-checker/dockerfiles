# install nightly rust
rustup toolchain install nightly --allow-downgrade --profile minimal --component clippy,rustfmt

rustc -vV
