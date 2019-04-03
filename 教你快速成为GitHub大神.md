## 如何快速成为GitHub大神

喜欢逛GitHub社区的程序员经常发现有很多大神的面板上有很多的贡献，比如这样

![尤溪雨的GitHub贡献面板](https://ws1.sinaimg.cn/large/006tKfTcly1g1p9kf0a7uj30zm0b6wek.jpg)

上图是尤溪雨的GitHub贡献面板。

然而自己的GitHub贡献面板却是这样

![](https://ws2.sinaimg.cn/large/006tKfTcly1g1p9oa824oj31620but8u.jpg)

更惨的可能是这样

![](https://ws2.sinaimg.cn/large/006tKfTcly1g1p9pjuitsj316k0c4jrh.jpg)

那我们如何将自己的面板美化成大神一样，虽然我们的实际编程能力没有大神那么厉害，但是打卡记录却能向大神看齐

今天就教大家一个方法，该方法可以让你轻松的实现GitHub打卡记录向大神一样，而且比大神还厉害。

要向贡献面板和大神一样，首先得搞清楚GitHub贡献面板的生成原理。

查看GitHub的帮助手册及实际实验发现，GitHub计算贡献的标准是按照你commit的时间计算的（GitHub是个面向全球的社区，为统一时间，系统会将你的本地时间转化为标准的格林威治时间）。这个时间是你在commit时git自动获取的系统时间。

那我们能否修改计算机系统时间去生成一个自己期望时间的commit。如果你这样做就有些麻烦了。其实git在commit时本身就提供了一个参数，让你可以指定commit时间。

```
  git commit -am "提交" --date="月 日 时间 年 +0800" 
```
代码中-date就是git指定commit时间的参数，这个参数接受一个如上的时间格式

日期格式中月份要是用缩写,缩写对照表如下

```
January, Jan.
February, Feb.
March, Mar.
April, Apr.
May, May.
June, Jun.
July, Jul.
August, Aug.
September, Sep.
October, Oct.
November, Nov.
December, Dec.
```

这样我们就能轻松的指定commit时间，比如现在是2019年，你可以指定一个2015年的commit

```
 git commit -am "提交" --date="May 7 9:05:20 2015 +0800" 
```

然后将你的commit push到GitHub中，你就可以看到，在2015年5月7日那天有一个commit记录了。

用这个方法去实现大神那样的面板，还是比较麻烦，连续几百次的commit还是很繁琐的，你可以写一个自动化脚本，帮你完成这样的事情。

脚本编写就不介绍了，如果该文能激发你去学习一下脚本的编写，那也是一件很有意义的事情。

好了，今天要介绍的内容就到这了。

最后说一句，该方法只是作为一种娱乐手段，不建议实际使用。