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
