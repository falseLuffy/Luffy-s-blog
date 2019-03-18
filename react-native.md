# react-native

## 准备工作

```
  npm intall react-native -g
```
等待安装完成

## 安装Xcode、Android-studio  
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

![模拟器显示](https://reactnative.cn/docs/assets/GettingStartediOSSuccess.png "项目开始")

在项目app.js 文件中修改一些东西，写入hello  world ;

***现在你已经开始了react-native的开发，其中会涉及很多其他技术比如redux react-native-navigation 等等技术，但是这些都是技术细节，并不是react-native的开发主干，在接触一门新技术时，能对该技术从开始到一个完成产品有个全流程感性的认识是非常重要，这将是你未来开发的灯塔，有了它，你再开发过程中便不会迷失方向；***

接下来我们需要对这个demo进行编译，感受一下，react-native如何做到跨平台编译项目的过程

## ios编译


```
cd ./ios && mkdir bundle
react-native bundle --entry-file index.js --platform ios --dev false --bundle-output ./ios/bundle/index.ios.jsbundle --assets-dest ./ios/bundle
```
该命令将在ios的bundle目录下生成一个index.ios.jsbundle，其他一些资源将在这个目录的assets目录下

- --entry-file ,ios或者android入口的js名称，比如index.js
- --platform ,平台名称(ios或者android)
- -dev ,设置为false的时候将会对JavaScript代码进行优化处理
- --bundle-output, 生成的jsbundle文件的名称，比如./ios/bundle/index.ios.jsbundle
- --assets-dest 图片以及其他资源存放的目录,比如./ios/bundle

也可在package.json 添加编译命令

```
 "scripts":{
        "bundle-ios":"node node_modules/react-native/local-cli/cli.js bundle --entry-file index.js  --platform ios --dev false --bundle-output ./ios/bundle/index.ios.jsbundle --assets-dest ./ios/bundle"
    }
```
使用
```
npm run bundle-ios
```
执行该命令

然后使用Xcode 打开 项目下的ios目录  把之前生成bundle文件夹拖拽到Xcode中和项目同名的文件夹中，注意要使用Create folder references添加文件夹
![添加bundle文件夹](https://user-gold-cdn.xitu.io/2018/7/17/164a60070fd22334?imageView2/0/w/1280/h/960/format/webp/ignore-error/1)

### 设置 AppDelegate.m 文件
修改AppDelegate.m中的加载包的方式（只需修改一次）,之后项目会自动跟据debug还是release状态加载不同的包

```
NSURL *jsCodeLocation;
#ifdef DEBUG
     //开发包
     jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index.ios" fallbackResource:nil];
#else
     //离线包
    jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"bundle/index.ios" withExtension:@"jsbundle"];
#endif
```

修改运行配置，将当前的模拟器模式修改为ios device模式，

![修改运行配置](http://www.hangge.com/blog_uploads/201503/2015030910075011157.png)

现在你就可以点击archive发行到appstore了，
![archive](https://user-gold-cdn.xitu.io/2018/7/17/164a603b4c7a6ffe?imageView2/0/w/1280/h/960/format/webp/ignore-error/1)

当然这里需要一个每年$99ios开发者账户，由于我没有，所以这一步暂停。


## Android 编译

Android 要求所有应用都有一个数字签名才会被允许安装在用户手机上，所以在把应用发布到类似Google Play store这样的应用市场之前，你需要先生成一个签名的 APK 包。Android 开发者官网上的如何给你的应用签名文档描述了签名的细节。本指南旨在提供一个简化的签名和打包 js 的操作步骤，不会涉及太多理论。

### 生成一个签名密钥

```
 keytool -genkey -v -keystore my-release-key.keystore -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000
```

这条命令会要求你输入密钥库（keystore）和对应密钥的密码，然后设置一些发行相关的信息。最后它会生成一个叫做my-release-key.keystore的密钥库文件。这个文件会存在于你执行以上命令的目录内


- 把my-release-key.keystore文件放到你工程中的android/app文件夹下。
- 编辑~/.gradle/gradle.properties（全局配置，对所有项目有效）或是项目目录/android/gradle.properties（项目配置，只对所在项目有效）。如果没有gradle.properties文件你就自己创建一个，添加如下的代码（注意把其中的****替换为相应密码）

```
MYAPP_RELEASE_STORE_FILE=my-release-key.keystore
MYAPP_RELEASE_KEY_ALIAS=my-key-alias
MYAPP_RELEASE_STORE_PASSWORD=*****
MYAPP_RELEASE_KEY_PASSWORD=*****
```

### 把签名配置加入到项目的 gradle 配置中

编辑你项目目录下的android/app/build.gradle，添加如下的签名配置：

```
...
android {
    ...
    defaultConfig { ... }
    signingConfigs {
        release {
            if (project.hasProperty('MYAPP_RELEASE_STORE_FILE')) {
                storeFile file(MYAPP_RELEASE_STORE_FILE)
                storePassword MYAPP_RELEASE_STORE_PASSWORD
                keyAlias MYAPP_RELEASE_KEY_ALIAS
                keyPassword MYAPP_RELEASE_KEY_PASSWORD
            }
        }
    }
    buildTypes {
        release {
            ...
            signingConfig signingConfigs.release
        }
    }
}
...

```
### 生成发行包 
```
cd android
./gradlew assembleRelease
```

然后就会生成一个Android的APK包，它的路径是android/app/build/outputs/apk/release/app-release.apk

在把发行版本提交到 Play Store 之前，你应该做一次最终测试。输入以下命令可以在设备上安装发行版本：

```
react-native run-android --variant=release
```

然后你可以将该apk包安装在Android手机上或者电脑的Android模拟器上
