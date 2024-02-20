#!/bin/sh
LANG=zh_CN.UTF-8
echo -e "\033[33m====== 初始化目录 ======\033[0m"
mkdir -p /root/alist
docker rm -f cnbbx_alist
echo -e "\033[33m====== 更新Docker ======\033[0m"
docker pull ghcr.io/cnbbx/cnbbx_alist:main
echo -e "\033[33m====== 修改CDN配置 ======\033[0m"
sed -i 's/"cdn":[^,]*/"cdn":"https:\/\/registry.npmmirror.com\/alist-web@$version\/dist\/"/' /root/alist/config.json
echo -e "\033[33m====== 启动Docker ======\033[0m"
docker run -d --name cnbbx_alist -v /root/alist:/opt/alist/data --security-opt seccomp:unconfined \
--restart=always -p 5244:5244 -d ghcr.io/cnbbx/cnbbx_alist:main
echo -e "\033[36m====== 启动成功 ======\033[0m"
