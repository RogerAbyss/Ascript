# pure-ftp server
[TOC]

## Info

以下是我的操作,大家也可以自定义:

* port: 21 & 60001/60101 & localhost (最多允许50个人,每个人占两个端口)
* dir: /home/ftpusers/abyss/ --> /home/ftpusers/abyss(映射到本机)
* acount: abyss 密码自己定
* name: ftpd_server

**友情提请: 请打开相应的服务器端口**

## Install

1. 拉取Docker
```
sudo docker pull registry.cn-hangzhou.aliyuncs.com/abyss/pure-ftpd
```

2. 配置运行docker
```
docker run -dt --name ftpd_server -p 21:21 -p 60001-60101:60001-60101 -e "PUBLICHOST=localhost" --privileged=true -v /home/ftpusers/abyss:/home/ftpusers/abyss registry.cn-hangzhou.aliyuncs.com/abyss/pure-ftpd bash
    docker exec -it ftpd_server /bin/bash
```

3. 创建账户并重新运行
```
docker exec -it ftpd_server /bin/bash
pure-pw useradd abyss -u ftpuser -d /home/ftpusers/abyss
pure-pw mkdb
/usr/sbin/pure-ftpd -c 50 -C 50 -l puredb:/etc/pure-ftpd/pureftpd.pdb -E -j -R -P $PUBLICHOST -p 60001:60101 &
```

4. 赋予操作权限
```
chmod -R 777 /home/ftpusers/abyss
```

## Custom

你可能需要进入 Docker内部进行管理
```
docker exec -it ftpd_server /bin/bash
```

