FROM node:20-alpine

# 安装必要依赖
RUN apk add --no-cache git

# 安装 Hexo CLI
RUN npm install -g hexo-cli

# 设置工作目录
WORKDIR /app

# 保留端口映射，方便需要时运行 hexo server
EXPOSE 4000

# 不指定 CMD，启动时自行传入命令
