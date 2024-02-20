# auto-build-alist-docker
直接官方最新编译版本

# 一键安装docker版alist 免配置初始化
```
curl -Lk http://hta.ink/alist | sh
```

# 查询alist密码 低于v3.25.0版本
```
docker exec -it cnbbx_alist ./alist admin
```

# 随机生成一个密码
```
docker exec -it cnbbx_alist ./alist admin random
```

# 手动设置一个密码,`NEW_PASSWORD`是指你需要设置的密码
```
docker exec -it cnbbx_alist ./alist admin set NEW_PASSWORD
```

# demo试玩
```
http://test.hta.ink/
```
