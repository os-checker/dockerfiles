# Install Rudra
git clone https://github.com/os-checker/Rudra.git /tmp/rudra
cd /tmp/rudra
git switch master
cargo install --path . --locked
cargo rudra --help

# Install Mirai
git clone https://github.com/os-checker/MIRAI.git /tmp/mirai
cd /tmp/mirai
git switch main
cargo install --path checker --no-default-features -F z3,z3-sys --locked
cargo mirai --help

# Install Rap
git clone https://github.com/os-checker/RAP.git /tmp/rap
cd /tmp/rap
git switch main
cd rap
cargo install --path .
cargo rap --help

# Install Lockbud
git clone https://github.com/os-checker/lockbud.git /tmp/lockbud
cd /tmp/lockbud
git switch all
cargo install --path .
cargo lockbud --help

# Install cargo-binstall
curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash

# Install cargo-audit
cargo binstall --force -y cargo-audit && cargo audit --version

# Install cargo-outdated
cargo binstall --force -y cargo-outdated && cargo outdated --version

# Install cargo-geiger
cargo binstall --force -y cargo-geiger && cargo geiger --version
