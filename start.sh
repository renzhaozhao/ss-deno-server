#!/bin/sh

# 定义变量
IMAGE_NAME='deno-image'
CONTAINER_NAME='deno-server'

# 构建docker镜像
docker build . -t $IMAGE_NAME:1.0.0 

# 删除dokcer容器
cid=$(docker ps -a | grep $CONTAINER_NAME |awk '{print $1}')
if [ x"$cid" != x ] 
then
  docker rm -f $cid
fi

# 启动Docker容器
docker run -p 80:3000 --name $CONTAINER_NAME $IMAGE_NAME:1.0.0 