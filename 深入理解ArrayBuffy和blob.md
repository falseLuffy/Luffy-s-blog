# 深入理解ArrayBuffer和blob

我们在下载文档时，responseType有时设置为blob，也有时设置为ArrayBuffer，好似他们都可以作为接受二进制内容的容器。但是有啥区别不是很理解。

blob(全称: binary large Object) : 不可变的类似文件对象的原始数据。

ArrayBuffer代表内存之中的一段二进制数据，一旦生成不能再改。可以通过视图（TypedArray和DataView）进行操作。

参考[理解arrayBuffy和blob的区别](https://blog.csdn.net/wkyseo/article/details/78232485)