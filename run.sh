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

# Install os-checker related

# Shared folder for cargo install. The folder will be deleted in the end.
export CARGO_TARGET_DIR=$INSTALL/target
mkdir -p $CARGO_TARGET_DIR

cargo install --git https://github.com/os-checker/os-checker.git os-checker os-checker-database 2>/dev/null
cargo install --git https://github.com/os-checker/plugin-github-api.git 2>/dev/null
cargo install --git https://github.com/os-checker/plugin-cargo.git 2>/dev/null
cargo install --git https://github.com/os-checker/docs.git 2>/dev/null

# Install web ui
git clone https://github.com/os-checker/os-checker.github.io.git $INSTALL/webui
cd $INSTALL/webui/os-checks
npm install 2>/dev/null && npm run generate 2>/dev/null && cp -LR dist /os_checker/

#Remove $INSTALL dir since we don't need them and the disk space needs to reduce
rm $INSTALL -rf
unset CARGO_TARGET_DIR

os-checker --help
which os-checker-database
which os-checker-plugin-docs
which os-checker-plugin-cargo
which os-checker-plugin-github-api

ls -alh /os_checker

mv /os_checker/dist /check/

cd /check
git lfs install --skip-smudge # 如果 lfs 下载不了大文件，跳过下载
wget https://raw.githubusercontent.com/os-checker/os-checker/refs/heads/main/Makefile
wget https://raw.githubusercontent.com/os-checker/os-checker/refs/heads/main/assets/repos-ui.json
gh release download -R os-checker/database cache-v8.redb -p repos-default.json
# wget https://github.com/os-checker/os-checker/raw/refs/heads/main/assets/repos.json
echo '{"os-checker/os-checker-test-suite":{}, "os-checker/os-checker":{}}' >repos.json

# export OS_CHECKER_CONFIGS="repos-default.json repos-ui.json"
export OS_CHECKER_CONFIGS="repos.json"

# # Run checker
# os-checker db --start cache.redb
# make run
# os-checker db --done cache.redb
#
# # Generate JSON results
# os-checker-database

# Generate api info
os-checker-plugin-github-api
mv tmp github-api

# Generate cargo info
os-checker-plugin-cargo
mv tmp cargo

# Generate rustdocs
os-checker-plugin-docs
