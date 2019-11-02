webpack 详解
webpack作为前端开发的首选工具，是每个前端开发都要面对的。
webpack功能强大，以至于有些功能我们猛然看到时，不知道这个功能的具体使用场景，随着我们的开发经验的积累，慢慢的发现一些功能在某些场景上非常好用，今天我们就梳理一下

require 详解

require

带表达式的require()
如果你的 request 含有表达式(expressions)，就会创建一个上下文(context)，因为在编译时(compile time)并不清楚具体导入哪个模块。

require.context()
你还可以通过 require.context() 函数来创建自己的 context。
可以给这个函数传入三个参数;一个要搜索的目录，一个标记表示是否还搜索其子目录， 以及一个匹配文件的正则表达式。

```
require.context(directory, useSubdirectories = false, regExp = /^\.\//);

```
