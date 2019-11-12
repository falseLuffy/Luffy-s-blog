[nginx 如何配置https服务](https://www.cnblogs.com/chen-msg/p/8583648.html)

## 准备工作

### 一、申请证书
HTTPS证书在很多网站都可以申请到，这个不一而至，下面给大家推荐其中之一。

[数安时代](https://certmall.trustauth.cn/Home/Member/index/id/1521167511.html)

该网站有较为完善的申请文档。当然阿里、腾讯也都能做到。


### 二、安装 openssl openssl-devel

```
yum install openssl openssl-devel
```

可查阅一下两个文档

http://www.cnblogs.com/chen-msg/p/8582374.html

http://www.cnblogs.com/chen-msg/p/7754411.html

## 配置


```
#user  nobody;
worker_processes  1;

#error_log  logs/error.log;
#error_log  logs/error.log  notice;
#error_log  logs/error.log  info;

#pid        logs/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       mime.types;
    default_type  application/octet-stream;

    #log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
    #                  '$status $body_bytes_sent "$http_referer" '
    #                  '"$http_user_agent" "$http_x_forwarded_for"';

    #access_log  logs/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    #keepalive_timeout  0;
    keepalive_timeout  65;

    #gzip  on;

    server {
        listen       80;
        server_name  localhost;

        #charset koi8-r;

        #access_log  logs/host.access.log  main;

        location / {
            root   /opt/my/html/pc/html/html;
            index  index.html;
        }

        location /sendTKL/ {
            proxy_pass  http://127.0.0.1:8688/water-tk-main/tklConvert/;
        }

        location /mytk/ {
            proxy_pass  http://127.0.0.1:8688/water-tk-main/;
            proxy_set_header Host $host:$server_port;

        }

        #error_page  404              /404.html;

        # redirect server error pages to the static page /50x.html
        #
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }

        # proxy the PHP scripts to Apache listening on 127.0.0.1:80
        #
        #location ~ \.php$ {
        #    proxy_pass   http://127.0.0.1;
        #}

        # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
        #
        #location ~ \.php$ {
        #    root           html;
        #    fastcgi_pass   127.0.0.1:9000;
        #    fastcgi_index  index.php;
        #    fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
        #    include        fastcgi_params;
        #}

        # deny access to .htaccess files, if Apache's document root
        # concurs with nginx's one
        #
        #location ~ /\.ht {
        #    deny  all;
        #}
    }


    # another virtual host using mix of IP-, name-, and port-based configuration
    #
    #server {
    #    listen       8000;
    #    listen       somename:8080;
    #    server_name  somename  alias  another.alias;

    #    location / {
    #        root   html;
    #        index  index.html index.htm;
    #    }
    #}


    # HTTPS server
    #
    server {
        listen         443 ssl;
        server_name  www.ttgwzs.com;  #网站域名，和80端口保持一致
        ssl             on;
        ssl_certificate /usr/local/nginx--with-http_stub_status_module/conf/www.ttgwzs.com_bundle.crt;       #证书公钥
        ssl_certificate_key  /usr/local/nginx--with-http_stub_status_module/conf/www.ttgwzs.com.key;  #证书私钥
        ssl_session_cache    shared:SSL:1m;
        ssl_session_timeout  5m;
        ssl_protocols TLSv1 TLSv1.1 TLSv1.2; 
        ssl_ciphers ECDH:AESGCM:HIGH:!RC4:!DH:!MD5:!3DES:!aNULL:!eNULL;
        ssl_prefer_server_ciphers  on;
        location / {
            proxy_pass http://www.ttgwzs.com;
            proxy_redirect  off;
            proxy_set_header        Host    $http_host;
            proxy_set_header        X-Real-IP       $remote_addr;
            proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
             
            proxy_set_header   Cookie $http_cookie;
            #proxy_cookie_path
            chunked_transfer_encoding       off;
        }

    }
}
```