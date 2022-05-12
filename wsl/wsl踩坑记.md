# wsl 踩坑记

## 1、 开启windows开发者模式

## 2、安装 wsl-Ubuntu  

## 3、设置用户名和密码

## 4、开启SSH

wsl安装成功后，默认状态SSH 是不开启的，这导致vscode无法连接。 所以需要手动开启SSH 


```
输入命令修改ssh_config文件: sudo vim /etc/ssh/sshd_config
主要修改下面两个地方
Port 22 #默认即可，如果有端口占用可以自己修改
PasswordAuthentication yes # 允许用户名密码方式登录

在wsl中执行sudo /etc/init.d/ssh start,启动ssh服务
可能会出现sshd: no hostkeys available -- exiting的报错
在 /etc/ssh路径下执行ssh-keygen -A可以解决。

成功启动ssh服务后，就可以用ssh终端发起连接了
address为127.0.0.1或者localhost，port为22
```

## 5、配置镜像


## 7、安装程序


有些沮丧，折腾了半天了，目前ubuntu还是无法ping通baidu.com，查询了一下，据说是由于防火墙的原因导致的。这个不搞了，未来再搞吧，目前还有一个vps可以使用