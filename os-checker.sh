export INSTALL=/os_checker/install

mkdir $INSTALL

# Install Rudra
git clone https://github.com/os-checker/Rudra.git $INSTALL/rudra
cd $INSTALL/rudra
git switch master
cargo install --path . --locked
cargo rudra --help

# Install Mirai
git clone https://github.com/os-checker/MIRAI.git $INSTALL/mirai
cd $INSTALL/mirai
git switch main
cargo install --path checker --no-default-features -F z3,z3-sys --locked
cargo mirai --help

# Install Rap
git clone https://github.com/os-checker/RAP.git $INSTALL/rap
cd $INSTALL/rap
git switch main
cd rap
cargo install --path .
cargo rap --help

# Install Lockbud
git clone https://github.com/os-checker/lockbud.git $INSTALL/lockbud
cd $INSTALL/lockbud
git switch all
cargo install --path .
cargo lockbud --help

cd /check

# Temporarily set rustup toolchain to make cargo commands work
rustup default nightly-2024-10-12

# Install cargo-binstall
curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash

# Install cargo-audit
cargo binstall --force -y cargo-audit && cargo audit --version

# Install cargo-outdated
cargo binstall --force -y cargo-outdated && cargo outdated --version

# Install cargo-geiger
cargo binstall --force -y cargo-geiger && cargo geiger --version

# # Install os-checker related
#
# # Shared folder for cargo install. The folder will be deleted in the end.
# export CARGO_TARGET_DIR=$INSTALL/target
# mkdir $CARGO_TARGET_DIR
#
# cargo install --git https://github.com/os-checker/os-checker.git os-checker os-checker-database
# cargo install --git https://github.com/os-checker/plugin-github-api.git
# cargo install --git https://github.com/os-checker/plugin-cargo.git
# cargo install --git https://github.com/os-checker/docs.git
#
# # Install web ui
# git clone https://github.com/os-checker/os-checker.github.io.git $INSTALL/webui
# cd $INSTALL/webui/os-checks
# npm install && npm run generate && cp -LR dist /os_checker/

# Remove $INSTALL dir since we don't need them and the disk space needs to reduce
rm $INSTALL -rf
