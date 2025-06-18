# 使用官方 Node.js 20 版本的轻量 Alpine 镜像作为基础镜像
FROM node:20-alpine

# 安装 git，因为 Hexo 部署功能需要用到 git 命令
RUN apk add --no-cache git

# 全局安装 Hexo 命令行工具
RUN npm install -g hexo-cli

# 设置容器工作目录为 /app，所有后续命令都在这里执行
WORKDIR /app

# 声明容器将监听的端口，方便后续端口映射
EXPOSE 4000

# 启动容器时默认执行 sh shell，保证容器启动后保持运行状态
CMD ["sh"]
