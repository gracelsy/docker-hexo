# 使用官方轻量 Node.js 20 Alpine 镜像作为基础镜像
FROM node:20-alpine

# 安装 git 和 openssh，安装 hexo-cli
RUN apk add --no-cache git openssh && \
    npm install -g hexo-cli

# 设置容器内默认工作目录，挂载 Hexo 项目代码时将映射至此目录
WORKDIR /app

# 对外暴露 Hexo 默认端口 4000
EXPOSE 4000

# 设置时区
ENV TZ=Asia/Shanghai

# 配置默认的 Git 用户信息（可通过 docker run -e 覆盖）
ENV GIT_USER="gracelsy"
ENV GIT_EMAIL="zyszyhzylsy@qq.com"

# 复制入口脚本并赋予执行权限
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# 设置容器启动时默认执行入口脚本
ENTRYPOINT ["/entrypoint.sh"]

# 防止容器退出，保持容器运行状态
CMD ["tail", "-f", "/dev/null"]
