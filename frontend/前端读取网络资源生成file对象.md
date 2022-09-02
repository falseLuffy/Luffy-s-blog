# 前端获取资源生成 file 对象

今天着手开发图文识别时遇到一个需求，页面初始化时需要有几张示例图片共用户选择，用户选择后，提交到后端进行图文识别。

这个需求的传统做法一般是前端与后端约定一个参数(或路径)，该参数将前端资源与后端资源映射，这样提交这个接口时，后端进行操作。但这个做法有些问题：

1. 增加后端接口数量，增加前后端联调工作量。
2. 示例图片无法根据具体业务场景随意更改。
3. 一旦示例图片修改后，前后端需要联动，增加后期维护成本

为解决一下问题，今天介绍一种前端自主获取资源，然后生成 file 对象，通过统一的上传接口实现示例图片的功能

使用的技术

1. canvas toBlob
2. File

### 原理

1. 首先手动创建一个 img 标签,使用 img 获取资源

```
let img = document.createElement('img')
img.src = 'url'
img.onload = function(function(){

})
```

2. 待图片加载完毕后，使用canvas将图片转换为blob对象

```
document.createElement('canvas');
canvas.width = img.width
cavas.height = img.height
canvas.drawImage(img,0,0)
canvas.toBlob(function(blob){
  console.log(blob)
})
```

3. 使用File构造函数将blob对象转换为file对象
```
let file = new File(blob,'demo.png')
```

#### 完整代码如下

```
let img = document.createElement('img');
img.src = href;
img.onload = (err) => {
  let canvas = document.createElement('canvas')
  canvas.height = img.height;
  canvas.width = img.width;
  let ctx = canvas.getContext('2d');
  ctx.drawImage(img, 0, 0);

  canvas.toBlob((blob)=> {
      let file = new File([blob],'demo.png');
      console.log(file)
  });
}
```

对于非图片资源，我们也可以通过URL.create​ObjectURL将字符串转换DataURL，然后再转换为blob对象，也可以直接转换为车blob, 之后在转化为file对象，可参考：[DataURL 与 File,Blob,canvas 对象之间的互相转换](https://blog.csdn.net/cuixiping/article/details/45932793)
[js中 文件、图片二进制和base64的互转](https://blog.csdn.net/Feb_kylin/article/details/79109321)

参考：

[canvas](https://developer.mozilla.org/zh-CN/docs/Web/API/Canvas_API/Tutorial/Basic_usage)的使用方法

[File](https://developer.mozilla.org/zh-CN/docs/Web/API/File/File)的使用方法




