#!/bin/sh

# 配置 Git 用户信息（如果环境变量已设置）
[ -n "$GIT_USER" ] && git config --global user.name "$GIT_USER"
[ -n "$GIT_EMAIL" ] && git config --global user.email "$GIT_EMAIL"

# 执行传递给容器的命令，默认执行 CMD 指定的命令
exec "$@"
