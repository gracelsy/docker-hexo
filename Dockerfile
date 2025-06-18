# 使用官方 Node.js 20 Alpine 版本作为基础镜像，体积小且轻量
FROM node:20-alpine

# 安装 git，Hexo 部署和版本控制常用
RUN apk add --no-cache git

# 全局安装 Hexo 命令行工具（hexo-cli），提供 hexo 命令
RUN npm install -g hexo-cli

# 设置容器内工作目录，挂载项目代码后默认路径
WORKDIR /app

# 声明容器监听的端口，Hexo 默认服务端口 4000
EXPOSE 4000

# 设置时区环境变量，默认上海时区
ENV TZ=Asia/Shanghai

# 设置 Git 用户名环境变量，容器运行时可传入实际值
ENV GIT_USER="gracelsy"

# 设置 Git 邮箱环境变量，容器运行时可传入实际值
ENV GIT_EMAIL="zyszyhzylsy@qq.com"

# 容器启动后默认进入 shell，方便手动执行命令（如 npm install、hexo server）
CMD ["sh"]
