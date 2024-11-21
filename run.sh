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

os-checker --help
which os-checker-database
which os-checker-plugin-cargo
which os-checker-plugin-github-api

ls -alh /os_checker

mv /os_checker/dist /check/

cd /check
wget https://raw.githubusercontent.com/os-checker/os-checker/refs/heads/main/Makefile
wget https://raw.githubusercontent.com/os-checker/os-checker/refs/heads/main/assets/repos-ui.json
gh release download -R os-checker/database cache-v8.redb -p repos-default.json
# wget https://github.com/os-checker/os-checker/raw/refs/heads/main/assets/repos.json
echo '{"os-checker/os-checker-test-suite":{}}' >repos.json

# export CONFIGS="repos-default.json repos-ui.json"
export CONFIGS="repos.json"
make run
