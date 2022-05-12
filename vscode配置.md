# vscode 配置

Webstorm为用户预安装了很多好用的插件，而在vscode中就需要用户自己慢慢摸索，为了给原有的Webstorm用户转移编辑器节省大量的摸索时间，现在特意将我使用的经验记录在这里。

首先说明一点，我是一名前端开发工程师兼嵌入式开发工程师，平时使用的语言有JavaScript和C，该配置也是这两种语言为设置对象

## 使用习惯修改
1. 下载JetBrains IDE KEyMap  ，使用之前熟悉的快捷键。
2. 设置open mode 为dobule click

## 版本管理
以我使用Webstorm的经验，觉得Webstorm的版本管理工具设计的非常好，功能丰富、使用方便，目前没有找到在vscode中有类似功能的插件，不过使用一些插件组合还是能完成类似的功能的。
1. Git Graph 可查看Git Log 执行rebase等操作
2. GitLens 分支间对比

## 代码比对
compareit  文件之间的代码比对/与clipboard代码比对


## 远程部署
1. Remote-SSH  可以直接编辑远程文件，但是无法在本地保存文件建立映射。未来找找有没有类似Webstrom的deployment的工具
2. upload  该插件可以将本地文件以ssh上传到服务器中，实现远程部署


## 代码格式化工具

1. ESLint   JavaScript 代码格式化工具   
2. C/C++    C语言代码格式化工具
这两个插件最好不要设置为相同快捷键，否者会出错

## 其他插件
1. open in brower

