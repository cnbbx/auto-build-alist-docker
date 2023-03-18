#!/bin/sh
LANG=zh_CN.UTF-8
echo "====== 初始化目录 ======"
mkdir -p /root/alist
docker rm -f cnbbx_alist
echo "====== 更新Docker ======"
docker pull ghcr.io/cnbbx/cnbbx_alist:main
echo "====== 执行命令查询密码 ======"
echo "查询命令：docker run -it -v /root/alist:/opt/alist/data ghcr.io/cnbbx/cnbbx_alist:main /opt/alist/alist admin>/root/alist/password.txt"
echo "====== 修改CDN配置 ======"
sed -i 's/"cdn":[^,]*/"cdn":"https:\/\/npm.elemecdn.com\/alist-web@$version\/dist\/"/' /root/alist/config.json
echo "====== 启动Docker ======"
docker run -d --name cnbbx_alist -v /root/alist:/opt/alist/data --security-opt seccomp:unconfined \
--restart=always -p 5244:5244 -d ghcr.io/cnbbx/cnbbx_alist:main
