# 选择官方轻量 Node.js 20 Alpine 镜像作为基础
FROM node:20-alpine

# 安装 git
RUN apk add --no-cache git

# 全局安装 hexo-cli，提供 hexo 命令
RUN npm install -g hexo-cli

# 设置容器内工作目录，挂载项目代码后默认路径
WORKDIR /app

# 容器对外暴露 Hexo 默认端口
EXPOSE 4000

# 设置默认时区环境变量
ENV TZ=Asia/Shanghai

# 设置 Git 用户和邮箱环境变量（容器启动时可通过 -e 覆盖）
ENV GIT_USER=""
ENV GIT_EMAIL=""

# 使用 ENTRYPOINT 指定容器启动后默认进入 sh shell
ENTRYPOINT ["sh"]
