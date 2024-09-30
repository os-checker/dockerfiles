export user=os-checker repo=os-checker
export branch=$(gh api repos/os-checker/os-checker --jq ".default_branch")

export meta="user: \"$user\", repo: \"$repo\", branch: \"$branch\""

# {
#   "author": {
#     "date": "2024-09-28T04:58:37Z",
#     "email": "jiping_zhou@foxmail.com",
#     "name": "zjp-CN"
#   },
#   "branch": "main",
#   "committer": {
#     "date": "2024-09-28T04:58:37Z",
#     "email": "noreply@github.com",
#     "name": "GitHub"
#   },
#   "mes": "Merge pull request #99 from os-checker/feat/db\n\nfeat: 使用 redb 嵌入式数据库进行检查结果缓存",
#   "repo": "os-checker",
#   "sha": "da81840e786e7e2c71329c30058347a45a3a2536",
#   "user": "os-checker"
# }
gh api repos/os-checker/os-checker/branches/$branch --jq \
  "{$meta, sha: .commit.sha, mes: .commit.commit.message, author: .commit.commit.author, committer: .commit.commit.committer}"

gh release download -R os-checker/database cache.redb -p cache.redb
echo "成功下载 cache.redb"
ls -alh

# gh release upload --clobber -R os-checker/database cache.redb cache.redb
# echo "成功上传 cache.redb"

# install ouch
# wget https://github.com/ouch-org/ouch/releases/download/0.5.1/ouch-x86_64-unknown-linux-gnu.tar.gz
# tar -zxvf ouch-x86_64-unknown-linux-gnu.tar.gz
# mv ouch-x86_64-unknown-linux-gnu/ouch ~/.cargo/bin
# compress cache.redb
# ouch c --slow cache.redb cache.redb.tar.gz
XZ_OPT=-e9 tar -cJvf cache.redb.tar.xz cache.redb
ls -alh
gh release upload --clobber -R os-checker/database cache.redb cache.redb.tar.xz
echo "成功上传 cache.redb.tar.xz"

# 解压缩
mkdir tmp
tar -xJvf cache.redb.tar.xz -C tmp
ls -alh tmp
