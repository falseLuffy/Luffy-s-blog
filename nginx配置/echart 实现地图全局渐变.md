# Echarts 地图实现全局渐变

[echarts 实现全局渐变](https://gallery.echartsjs.com/editor.html?c=xrClWbmNsG)
[渐变值详解](http://www.voidcn.com/article/p-rlpklfob-bps.html)

该渐变在最新版的echarts上不生效，具体是因为bug还是确实移除了该功能不得而知，在GitHub上提了issue也没得到回复。所以使用该功能前请将echarts版本固定在4.2.1版本

颜色设置
```
areaColor: {
    type: 'linear-gradient',
    x: 0,
    y: 34.5,//上
    x2: 0,
    y2: 29.5, //下
    colorStops: [{
        offset: 0,
        color: 'red' // 0% 处的颜色
    }, {
        offset: 1,
        color: 'blue' // 50% 处的颜色
    }],
    global: true // 缺省为 false
},
```

显示效果如下

![](https://i.loli.net/2019/11/12/zcgirICnhosT5UL.png)