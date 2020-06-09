# ss-deno-server

## 打包镜像
```shell
$ docker build . -t deno-image:1.0.0
```

## 运行服务
```shell
$ docker run -p 80:3000 -it --name deno-server deno-image:1.0.0
```
