FROM node:20-alpine

RUN apk add --no-cache git

RUN npm install -g hexo-cli

WORKDIR /app

# 不设置 CMD，让用户自行指定命令
