# svg制作流动路径

本片文章的流动路径不是重点，重点是如何计算贝塞尔曲线的长的

### 流动曲线的实现
[https://juejin.im/post/598009f46fb9a03c43007a7b](https://juejin.im/post/598009f46fb9a03c43007a7b)

先看demo
[demo](file:///Users/wy/Documents/Frontend/Project/helloWorld-developer/idea/svg.html)

原理是利用svg stroke-dashoffset的变化，实现流动曲线的效果，代码如下

html
```
<svg xmlns="http://www.w3.org/2000/svg" version="1.1">
    <path d="M20,20 C90,40 130,40 180,20" stroke="#000000" fill="none" style="stroke-width: 2px;"></path>
    <path d="M20,20 C90,40 130,40 180,20" stroke="rgb(190,190,0)" class="float" fill="none" style="stroke-width: 2px;"></path>
  </svg>
```

css

```
 .float {
      stroke-dasharray: 40;
      animation: animate 5s linear infinite;
    }

    @keyframes animate {
      0% {
        stroke-dashoffset: 500 // 曲线的长度
      }

      100% {
        stroke-dashoffset: 0
      }
```

但是这里面需要使用到曲线的长度，这个不太好计算，下面重点说明，贝塞尔曲线的长度如何计算。

### 贝塞尔曲线科普

二次贝塞尔曲线

![](https://www.zhihu.com/equation?tex=Q%28t%29%3D%281-t%29%5E%7B2%7D+%2AP_%7B0%7D%2B2t%281-t%29%2AC_%7BP%7D%2Bt%5E%7B2%7D%2AP_%7B1%7D)

三次贝塞尔曲线
![](https://pic4.zhimg.com/80/f7a8cdb450180d48dd210b496e47d42e_hd.jpg)

![](https://www.zhihu.com/equation?tex=C%28t%29%3D%281-t%29%5E%7B3%7DP_%7B0%7D%2B3t%281-t%29%5E%7B2%7DC_%7B0%7D%2B3t%5E%7B2%7D%281-t%29C_%7B1%7D%2Bt%5E%7B3%7DP_%7B1%7D)