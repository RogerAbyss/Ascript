# ss
[TOC]

## Info

ss+kcptun加速(8M极小)

以下是我的操作,大家也可以自定义:
port: 1723 & localhost
加密: aes-256-cfb 
默认密码: dockone.io 
kcptun: 1724 
模式: fast2

**友情提请: 请打开相应的服务器端口**

## Install

1. 拉取Docker
```
docker pull registry.cn-hangzhou.aliyuncs.com/abyss/shadowsocks
```

2. 配置运行docker
```
docker run -dt --name ss -p 1723:1723 -p 1724:1724/udp registry.cn-hangzhou.aliyuncs.com/abyss/shadowsocks -s "-s :: -s 0.0.0.0 -p 1723 -m aes-256-cfb -k dockone.io --fast-open" -k "-t 127.0.0.1:1724 -l :1724 -mode fast2" -x
```
