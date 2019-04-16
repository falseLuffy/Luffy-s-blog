今天做预览本地图片的功能，把本地文件读取为base64，然后插入img的src中显示预览信息，如下

![](https://ws2.sinaimg.cn/large/006tNc79ly1g24i4d7eetj30q40wkdgu.jpg)

可以看到上图中的图片比较小，希望能放大，那打开一个新页面时最近单的方法了。

那我直接给图片包裹一个a标签，target设置为_blank，这样很简单嘛！

可是却遇到了这个

![](https://ws3.sinaimg.cn/large/006tNc79ly1g24i8kcqtpj30qs06ajrq.jpg)

what！！！  Not allowed to navigate top frame to data URL

怎么回事，我记得之前是可以的啊。肯定是谷歌又出幺蛾子了。查查文档吧

![](https://ws1.sinaimg.cn/large/006tNc79ly1g24iclmsqvj31na0u077i.jpg)

原来谷歌基于安全性考虑，禁止在top frame 中加载data URL了
所以,a标签, window.open, window.location and similar mechanisms 这些方法统统无法打开data URL了。知道原因，那就简单了。

既然在顶层页面无法打开data URL,那我们把他放在次顶层

```
win = window.open()
win.write('<iframe src="data URL"></iframe>')
```

这样就能搞定了。好的收工。

参考：
[Intent to Deprecate and Remove: Top-frame navigations to data URLs](https://groups.google.com/a/chromium.org/forum/#!topic/blink-dev/GbVcuwg_QjM%5B101-125%5D)