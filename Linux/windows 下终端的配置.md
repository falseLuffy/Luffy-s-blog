# windows 下的终端配置

由于windows下没有好用的终端工具，很多同学都是使用其他的shell工具替代。但是操作起来还是无法与mac相比

最近折腾windows发现window自己开发了一个终端工具，该工具可以集成其他命令行工具，而且提供可自定义快捷方式

由此，我们以windows终端外壳，配置一个好用的终端工具

1. 首先需要在Micsoft Store 中下载终端工具软件
2. 下载并安装git，我们要在终端运行git-bash，来作为shell工具
3. 启动终端工具，点击向下箭头号，选择设置，选择打开JSON配置文件，
 修改profiles， 复制一个对象，将commandline字段对应的路径修改为Git Bash的路径

4. 修改快捷键和主题。

这样，一个顺手好用的命令行就完成了。大家可以自己试试