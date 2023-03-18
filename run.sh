#!/bin/sh
docker rm -f cnbbx_alist
docker pull ghcr.io/cnbbx/cnbbx_alist:main
mkdir -p /root/alist
docker run -it -v /root/alist:/opt/alist/data ghcr.io/cnbbx/cnbbx_alist:main /opt/alist/alist admin > /root/alist/password.txt
cat /root/alist/password.txt
sed -i 's/"cdn":[^,]*/"cdn":"https:\/\/npm.elemecdn.com\/alist-web@$version\/dist\/"/' /root/alist/config.json
docker run -d --name cnbbx_alist \
-v /root/alist:/opt/alist/data \
--security-opt seccomp:unconfined \
--restart=always \
-p 5244:5244 \
-d ghcr.io/cnbbx/cnbbx_alist:main
