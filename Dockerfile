# 选择官方轻量 Node.js 20 Alpine 镜像作为基础
FROM node:20-alpine

# 安装 git 和 openssh，安装 hexo-cli，全局配置 git 用户信息（默认空）
RUN apk add --no-cache git openssh && \
    npm install -g hexo-cli
    
# 设置容器内工作目录，挂载项目代码后默认路径
WORKDIR /app

# 容器对外暴露 Hexo 默认端口
EXPOSE 4000

# 设置默认时区环境变量
ENV TZ=Asia/Shanghai

# 设置 Git 用户和邮箱环境变量（容器启动时可通过 -e 覆盖）
ENV GIT_USER="gracelsy"
ENV GIT_EMAIL="zyszyhzylsy@qq.com"

# 入口脚本，启动时设置 git 用户配置并进入 shell
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
