#!/bin/bash

# 自动化 git add, commit 和 push 脚本

# 检查是否有未提交的更改
if [[ -n $(git status --porcelain) ]]; then
    # 添加所有更改
    git add .

    # 提示用户输入提交信息
    echo "请输入提交信息: "
    read commit_message

    # 如果用户没有输入提交信息，使用默认信息
    if [[ -z "$commit_message" ]]; then
        commit_message="Auto-commit: $(date)"
    fi

    # 提交更改
    git commit -m "$commit_message"

    # 推送到远程仓库
    git push

    echo "更改已成功推送到远程仓库。"
else
    echo "没有检测到任何更改，无需提交。"
fi