#!/bin/sh

# 定义变量
IMAGE_NAME='deno-image'
CONTAINER_NAME='deno-server'

# 删除dokcer容器
cid=$(docker ps -a | grep $CONTAINER_NAME | awk '{print $1}')
if [ x"$cid" != x ] 
then
  docker rm -f $cid
fi

# 删除docker镜像
iid=$(docker images | grep $IMAGE_NAME | awk '{print $3}')
if [ x"$iid" != x ]
then
  docker image rm $iid
fi

# 构建docker镜像
docker build . -t $IMAGE_NAME:1.0.0 

# 启动Docker容器
docker run -d -p 80:3000 --name $CONTAINER_NAME $IMAGE_NAME:1.0.0