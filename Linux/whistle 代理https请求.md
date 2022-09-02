# whistle 代理https请求
whistle是一个款node编写的服务代理软件，可以非常便利的代理用户定义的各种请求。
之前服务的安全性要求不高，一直使用http请求，最近做一个音频录音上传，由于浏览器的安全机制，想要调用麦克风和摄像头的权限必须在https和file协议下。
但是服务端的接口仍然是http协议，为了便于开发，我们可以使用whistle将本地的https协议转发到服务端的http协议请求。

配置步骤如下：

点击如图所示的红框按钮
![](http://ww2.sinaimg.cn/large/006tNc79ly1g5l26vmjkuj31j404wjrk.jpg)

勾选 capture tunnel connects
![](http://ww1.sinaimg.cn/large/006tNc79ly1g5l2e0idi5j30mq0swmxn.jpg)

这样便能代理https协议了。

但是，这样配置存在一个小的警告问题，由于whistle本身的证书并不被浏览器认证。所以需要系统本身认证一下。

点击上图download RootCA

 # MacOS证书安装

## windows系统下证书安装

 windows系统的证书安装较为简单，双击证书文件按照指示安装就可以，安装成功需要重启系统

![](https://i.loli.net/2019/10/23/jtn7BaWGsJr13cy.png)

![](https://i.loli.net/2019/10/23/ULseTSXoC346bwO.png)

接下来一直点下一步直到完成

## MacOS 系统下证书的安装
下载完成后，点击下载文件，将文件添加到“钥匙串”中，

选择登录，证书选项  找到whistle的证书

![](http://ww1.sinaimg.cn/large/006tNc79ly1g5l2jpcktfj31me0u00u4.jpg)

双击打开配置页面

![](http://ww3.sinaimg.cn/large/006tNc79ly1g5l2kv3aooj30si0o00tt.jpg)

将如下选项设置为信任，然后重启系统，便配置完成，

然后在配置文件中写下: https://xxx.com  http://sss.com

最后就是愉快的开发时间了。