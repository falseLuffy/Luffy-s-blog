# Mac应用程序无法打开或文件损坏的处理方法

大多数用户在安装 Mac 应用时，经常会遇到提示 “ XXX.app 已损坏，打不开。您应该将它移到废纸篓 ” 或 “ 打不开 XXX.app，因为它来自身份不明的开发者 ” ，如下图所示：

![](https://ws3.sinaimg.cn/large/006tNc79ly1g30zgwz7rbj30mi07yab2.jpg)

或

![](https://ws4.sinaimg.cn/large/006tNc79ly1g30zh8ox30j30me09wq46.jpg)

遇到这种问题如果是macOS Sierra 10.12及以上的用户 可选择方法一，以下用户选择方法二

### 方法一
打开终端（Terminal.app）

拷贝粘贴 sudo spctl --master-disable，按回车键

输入你的账户密码，按回车键确认执行（该密码不会显示，直接输入即可）


![](https://ws3.sinaimg.cn/large/006tNc79ly1g30ziz305xj30jo07yjs9.jpg)

### 方法二
打开系统偏好设置界面，进入安全性与隐私
2. 点按左下角的锁头图标，解锁更改权限

3. 将允许从以下位置下载的应用，更改为 “ 任何来源 ” ，然后再打开应用即可


[Mac应用程序无法打开或文件损坏的处理方法](https://www.jianshu.com/p/6e269bf36009)