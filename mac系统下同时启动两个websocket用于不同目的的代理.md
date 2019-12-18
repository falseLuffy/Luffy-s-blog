# mac系统下同时启动两个websocket用于不同目的的代理

### 场景
  当前我所服务的公司内网由于和阿里的合作关系，屏蔽了腾讯系的一切服务，包括但不限于qq、微信、QQ邮箱、腾讯门户网站等等，由于腾讯的通讯软件在中国拥有霸主地位，生活和工作不太可能绕开他，所以想要访问就必须使用代理服务，而
### 目的
如题，本文的目的很明确，就是为了实现运行两个代理本地两个代理服务同时运行

在windows平台，我们可以对shadsocks客户端分别配置不同的本地服务，但是在macOS系统里，
shadowsocks只能运行一个客户端，所以另外一个就得自己另行开启服务

在这里我使用的是shadowsock-libev,这是macOS包管理器存在的一个包，我们可以使用brew轻松的安装

```
 brew install shadowsocks-libev  
```

安装过程如果卡在brew  updating中可以执行ctr + c 中断brew的更新，如果想永久解决，可以搜索brew修改镜像源，把brew的镜像源修改为淘宝或者中科大的，就不会出现这样的问题了

安装完成后，你会看到一行提示

```
To have launchd start shadowsocks-libev now and restart at login:
  brew services start shadowsocks-libev
Or, if you don't want/need a background service you can just run:
  /usr/local/opt/shadowsocks-libev/bin/ss-local -c /usr/local/etc/shadowsocks-libev.json
```

这表示shadowsocks-libev已经安装成功了，先不急着运行该软件，之后你录入你的shadowsocks服务地址

使用
```
vi  usr/local/etc/shadowsocks-libev.json

```

打开配置文件，你会看到

```
{
    "server": "服务地址",
    "server_port": 服务端口,
    "local_port": 本地启动的服务端口,
    "password": "shadowsocks服务密码",
    "timeout": 600,
    "method": "所采用的插件名称"
}
```

录入相关信息后执行

```
brew services start shadowsocks-libev
```

使用
```
lsof -i :1087
```

查看你的服务是否已经启动

如果没有启动，执行

```
/usr/local/opt/shadowsocks-libev/bin/ss-local -c /usr/local/etc/shadowsocks-libev.json
```

查看错误日志，做出适当修改后，再次启动

这样就达到了我们预期目标。

[参考链接](https://medium.com/@yanlong/macos%E4%BD%BF%E7%94%A8shadowsocks-libev-simple-obfs%E6%95%99%E7%A8%8B-c10eba9c0758)