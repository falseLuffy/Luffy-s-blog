# linux vi快捷键使用笔记

### 入门

#### 入门操作
```
esc 进入一般模式
i 插入
q 退出
w 保存
wq 保存退出
q! 强制退出
```

移动操作

* \+: 光标移动到非空格符的下一行
* \-: 光标移动到非空格符的上一行
* G: 移动到这个档案的最后一行(常用)
* H: 光标移动到这个屏幕的最上方那一行的第一个字符
* M: 光标移动到这个屏幕的中央那一行的第一个字符
* L: 光标移动到这个屏幕的最下方那一行的第一个字符

#### 入门时可能遇到的问题
[Linux之vi编辑模式下Backspace无法退格删除和上下左右出现字母问题解决](https://blog.csdn.net/u011304490/article/details/81367490)

```
一、vi编辑模式下Backspace无法退格删除

命令模式下输入：set nocp

二、vi编辑模式下上下左右出现字母

sudo vi  /etc/vim/vimrc.tiny

修改　　set compatible  为  set nocompatible      设置是否兼容
添加　　set backspace=2　　　　　　　　　     设置 backspace可以删除任意字符
```


查询
```
/查询内容
enter查询下一个
```


```
dd 删除整行

```

其他一些用法

[VI中的多行删除与复制](https://blog.csdn.net/wallwind/article/details/7633356)