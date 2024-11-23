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

echo "install os-checker & os-checker-database"
cargo install --git https://github.com/os-checker/os-checker.git os-checker os-checker-database 2>/dev/null
# echo "install os-checker-plugin-github-api"
# cargo install --git https://github.com/os-checker/plugin-github-api.git 2>/dev/null
# echo "install os-checker-plugin-cargo"
# cargo install --git https://github.com/os-checker/plugin-cargo.git 2>/dev/null
# echo "install os-checker-plugin-docs"
# cargo install --git https://github.com/os-checker/docs.git 2>/dev/null

# # Install web ui
# git clone https://github.com/os-checker/os-checker.github.io.git $INSTALL/webui
# cd $INSTALL/webui/os-checks
# echo "build webui"
# npm install 2>/dev/null && npm run generate 2>/dev/null 1>/dev/null && cp -LR dist /os_checker/

#Remove $INSTALL dir since we don't need them and the disk space needs to reduce
tree -L 3 -h $INSTALL
rm $INSTALL -rf
unset CARGO_TARGET_DIR

os-checker --help
which os-checker-database
# which os-checker-plugin-docs
# which os-checker-plugin-cargo
# which os-checker-plugin-github-api

ls -alh /os_checker

# mv /os_checker/dist /check/

cd /check
git lfs install --skip-smudge # 如果 lfs 下载不了大文件，跳过下载
wget https://raw.githubusercontent.com/os-checker/os-checker/refs/heads/main/Makefile
wget https://raw.githubusercontent.com/os-checker/os-checker/refs/heads/main/assets/repos-ui.json
gh release download -R os-checker/database cache-v8.redb -p repos-default.json
# wget https://github.com/os-checker/os-checker/raw/refs/heads/main/assets/repos.json
# echo '{"os-checker/os-checker-test-suite":{}, "os-checker/os-checker":{}}' >repos.json
echo '{"os-checker/os-checker-test-suite":{}}' >repos.json

# export OS_CHECKER_CONFIGS="repos-default.json repos-ui.json"
export OS_CHECKER_CONFIGS="repos.json"

# Run checker
os-checker db --start cache.redb
PUSH=true make run
os-checker db --done cache.redb

# Generate JSON results
os-checker-database

# # Generate api info
# os-checker-plugin-github-api
#
# # Generate cargo info
# os-checker-plugin-cargo
#
# # Generate rustdocs
# os-checker-plugin-docs
#
# # deploy -> /check/dist/docs (NOTE: WebUI should not define docs page/route)
# mv deploy dist/docs
#
# git config --global user.name $GIT_AUTHOR
# git config --global user.email $GIT_EMAIL
# git config --global committer.name $GIT_AUTHOR
# git config --global committer.email $GIT_EMAIL
#
# echo "正在 clone" $DATABASE_REPO
# gh repo clone $DATABASE_REPO $DATABASE_REPO
# gh auth setup-git
# echo "成功 clone" $DATABASE_REPO
#
# # clean old plugin dir
# rm $DATABASE_REPO/plugin -rf
#
# # cargo -> $DATABASE_REPO/plugin/cargo/info
# mkdir -p $DATABASE_REPO/plugin/cargo
# mv cargo $DATABASE_REPO/plugin/cargo/info
#
# # github-api -> $DATABASE_REPO/plugin/github-api
# mv github-api $DATABASE_REPO/plugin
#
# # commit & push changes
# cd $DATABASE_REPO
# echo "update plugin folder for" $DATABASE_REPO
# export branch=$(git branch --show-current)
#
# git status
# git add .
# echo "正在提交：$(git status --porcelain)"
# git commit -m "[bot] update plugin dir from os-checker-plugin-github-api repo"
# echo "提交成功，正在推送到 database 仓库（分支：$branch）"
# git push
# echo "成功推送到 database 仓库（分支：$branch）"
