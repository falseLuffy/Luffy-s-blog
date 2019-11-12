# nginx 代理转发 socket

### 概述
> &nbsp;前段时间开发web ssh功能，需用到websocket连接后端服务，由于deadline逼近，而自己之前也没有nginx 转发socket的配置经验，为了项目能快速上线，采用了配置文件的方式直接将后端服务地址写在了配置文件里，这样虽然也能解决问题，但是不够优雅。今天闲下来，看到之前在文档里留下的一个坑位，抓紧时间给他补齐，为未来留下技术储备。


## 一、nginx软件的安装

准备一台linux服务器。nginx官网：http://nginx.org/ 。在网上搜到大致用的是 ngx_stream_core_module 这个模块，这里你也可以关注一下官方文档中的其他模块都是做什么的，那么这有相关的启用配置说明，与示例配置。

第一句便是：该ngx_stream_core_module模块是自1.9.0版本。此模块不是默认构建的，应使用配置参数启用 --with-stream 。

那好吧，我们就安装nginx，搞这个的，安装应该都会吧。

```
[root@localhost /]# cd /usr/local/src
[root@localhost src]# wget http://nginx.org/download/nginx-1.11.10.tar.gz
```

然后解压，解压完，根据文档提示需要使用这个参数--with-stream 来启用功能。

```
[root@localhost src]# ./configure  --prefix=/usr/local/nginx --with-stream 
```

然后，make，make install。


## 二、nginx 相关配置
完成之后就是nginx配置文件啦，这个文档中有示例，可知与events模块平级，按照这做就好啦。

```
worker_processes  1;
#error_log  logs/error.log;
#error_log  logs/error.log  notice;
#error_log  logs/error.log  info;
#pid        logs/nginx.pid;
events {
    worker_connections  1024;
}
stream{
    upstream abc{
        server 172.18.8.196:11911;
    }
    server{
        listen 11911;
        proxy_pass abc;
    }
}

```

ok,保存退出，重启nginx使配置生效即可。到这里所有的操作就都完成啦，让我们拭目以待，看下结果吧。


当然这只是一个demo  如果生产环境中使用，还需要完善。

### 相关参考资料

[nginx socket 代理配置](https://blog.csdn.net/weixin_37264997/article/details/80341911)

[Nginx支持Socket转发过程详解](https://www.cnblogs.com/knowledgesea/p/6497783.html)