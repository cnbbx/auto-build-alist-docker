#!/bin/sh
LANG=zh_CN.UTF-8
echo "❤️Initialize directory"
mkdir -p /root/alist
docker rm -f cnbbx_alist
echo "❤️Update docker"
docker pull ghcr.io/cnbbx/cnbbx_alist:main
echo "❤️Output password file: /root/alist/password.txt"
docker run -it -v /root/alist:/opt/alist/data ghcr.io/cnbbx/cnbbx_alist:main /opt/alist/alist admin>/root/alist/password.txt
cat /root/alist/password.txt
echo "❤️Modify CDN configuration"
sed -i 's/"cdn":[^,]*/"cdn":"https:\/\/npm.elemecdn.com\/alist-web@$version\/dist\/"/' /root/alist/config.json
echo "❤️Start docker"
docker run -d --name cnbbx_alist -v /root/alist:/opt/alist/data --security-opt seccomp:unconfined \
--restart=always -p 5244:5244 -d ghcr.io/cnbbx/cnbbx_alist:main
