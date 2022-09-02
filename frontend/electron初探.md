# electron 初探

[demo](https://github.com/falseLuffy/electron-template)

## electron 安装问题汇总
无论是node install.js慢还是没有权限等问题

原因是下载[https://github.com/electron/electron/releases/download/v7.0.0/electron-v7.0.0-win32-x64.zip](https://github.com/electron/electron/releases/download/v7.0.0/electron-v7.0.0-win32-x64.zip)的时候很慢, 

或者是

C盘用户\AppData\Local\Temp\electron-download-RHkfjm\electron-v7.0.0-win32-x64.zip

目录没有权限

一、处理权限

打开

C:\\Users\

对当前的用户, 一般是 Administrator 文件夹, 右键->属性, 把只读的勾勾去掉

 

二、慢的问题

打开

C盘用户\AppData\Roaming\npm\node_modules\electron\node_modules\@electron\get\dist\cjs\GotDownloader.js

download函数可以查看当前路径和下载的url

 

三、最终解决权限问题

进入目录

C:\Users\Administrator\AppData\Roaming\npm\node_modules\electron

在这个目录下面

node install.js

然后没报错就等，最好整台电脑全局翻墙再运行

[electron打包可选择安装位置，可自动更新](https://blog.csdn.net/weixin_34179762/article/details/88832654)

[Electron 热更新和electron-builder 打包](http://www.weilai.info/rear_end/339.html)

[Electron 系统托盘图标/任务通知栏图标/右下角图标](http://www.51xuediannao.com/javascript/electron_tuopan.html)

[electron应用任务栏图标闪烁提醒](http://www.51xuediannao.com/javascript/electron_tuopan.html)

[Electron去掉边框(标题栏)并设定可拖动](https://blog.csdn.net/toubennuhai/article/details/53039612)

[electron Windows和mac 的菜单栏隐藏](https://www.cnblogs.com/wupeng88/p/10510997.html)

[electron 概览](https://juejin.im/post/5cfd2ec7e51d45554877a59f)

[用JS开发跨平台桌面应用，从原理到实践](https://developer.mozilla.org/en-US/docs/Mozilla/Projects/SpiderMonkey/Parser_API#Node_objects)