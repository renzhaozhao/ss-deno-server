# 拉取镜像
FROM hayd/alpine-deno:1.0.0

# 设定工作目录
WORKDIR /opt

# 复制文件
COPY . /opt

# 运行命令
CMD ["run", "--allow-net", "app.ts"]