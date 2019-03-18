### react-native

#### 准备工作

```
  npm intall react-native -g
```
等待安装完成

### 安装Xcode、Android-studio  
  Xcode 可以在Mac的AppStore中搜索安装

  Android-studio的程序包可以在网上搜索到，安装Android-studio时需要注意的是在安装到需要设置proxy时点击取消键，*之前由于大陆防火墙的原因，Android-studio需要设置代理才能安装，现在无需设置代理了*。

### 正式开始

在你选择的创建项目路径下，命令行输入

```
react-native init HelloReactNative
```
每个人根据各自网络情况，下载生成项目的时间不同

当项目生成完毕后，输入

```
cd HelloReactNative

react-native run-ios
```
等待项目的编译以及模拟器的启动

![模拟器显示](https://upload-images.jianshu.io/upload_images/6860761-fd2f51090a890873.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/550/format/webp "区块链")

在项目app.js 文件中修改一些东西，写入hello  world 