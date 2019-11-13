# webpack引入非模块化插件

当前webpack作为构建工具开发前端项目非常方便
但是由于历史原因，以及个别开发者的个人偏好，很多插件并没有不止es6 的import的语法
未解决这类问题，开发者开发了一个插件 --- exports-loader

对于未模块化的插件，我们可以使用

```
  import *** from 'exports-loader?window.***!插件地址'
```

例如我本人使用过的一个插件引入语法就是

```
import Recorder from 'exports-loader?window.Recorder!../../js/recorder.wav.min.js'
```

这是个录音直接输出mp3或wav格式音频的插件，具体该插件的使用我会再写一篇文章来讲述