# install nightly rust
rustup toolchain install $OS_CHECKER_RUST_TOOLCHAIN --allow-downgrade --profile minimal --component clippy,rustfmt

rustc -vV

# Install Rudra
git clone https://github.com/os-checker/Rudra.git
cd Rudra
git switch master
cargo install --path . --locked
cargo rudra --help

# Install Mirai
git clone https://github.com/os-checker/MIRAI.git
cd MIRAI
git switch main
cargo install --path checker --no-default-features -F z3,z3-sys --locked
cargo mirai --help

# Install Rap
git clone https://github.com/os-checker/RAP.git
cd RAP
git switch main
cd rap
cargo install --path .
cargo rap --help

# Install Lockbud
git clone https://github.com/os-checker/lockbud.git
cd lockbud
git switch all
cargo install --path .
cargo lockbud --help
