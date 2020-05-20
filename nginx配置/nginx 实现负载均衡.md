# Nginx服务器之负载均衡策略（6种）
## 一、关于Nginx的负载均衡
　在服务器集群中，Nginx起到一个代理服务器的角色（即反向代理），为了避免单独一个服务器压力过大，将来自用户的请求转发给不同的服务器。详情请查看我的另一篇博客。

## 二、Nginx负载均衡策略
负载均衡用于从“upstream”模块定义的后端服务器列表中选取一台服务器接受用户的请求。一个最基本的upstream模块是这样的，模块内的server是服务器列表：

```
 #动态服务器组
  upstream dynamic_zuoyu {
    server localhost:8080;  #tomcat 7.0
    server localhost:8081;  #tomcat 8.0
    server localhost:8082;  #tomcat 8.5
    server localhost:8083;  #tomcat 9.0
  }
```

在upstream模块配置完成后，要让指定的访问反向代理到服务器列表：
```
#其他页面反向代理到tomcat容器
  location ~ .*$ {
    index index.jsp index.html;
    proxy_pass http://dynamic_zuoyu;
  }
```

这就是最基本的负载均衡实例，但这不足以满足实际需求；目前Nginx服务器的upstream模块支持6种方式的分配：

负载均衡策略
轮询|默认方式
:-------|:-------:
weight  | 权重方式
ip_hash	| 依据ip分配方式
least_conn	| 最少连接方式
fair（第三方）	| 响应时间方式
url_hash（第三方）	| url_hash（第三方）