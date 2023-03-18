# auto-build-alist-docker
auto build alist docker

# 一键安装docker版alist 免配置初始化
```
curl -Lk http://hta.ink/alist | sh
```

# 查询alist密码
```
docker run -it -v /root/alist:/opt/alist/data ghcr.io/cnbbx/cnbbx_alist:main /opt/alist/alist admin | tee /root/alist/password.txt
```
# demo试玩
```
http://test.hta.ink/opt/alist/data/password.txt
```
