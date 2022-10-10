[puppeteer](https://github.com/puppeteer/puppeteer)

[知乎上关于puppeteer介绍](https://zhuanlan.zhihu.com/p/40103840)

##  可以做什么

- 生成网页截图或者 PDF
- 抓取单页应用(SPA)执行并渲染
- 做表单的自动提交、UI的自动化测试、模拟键盘输入等
- 用浏览器自带的一些调试工具和性能分析工具帮助我们分析问题
- 在最新的无头浏览器环境里做测试、使用最新浏览器特性

## 安装
```
npm i puppeteer -S
```

## 使用

```
const browser = await puppeteer.launch({
  headless: false // 关闭无头模式
})
const page = await browser.newPage()
await page.goto('http://www.baidu.com/')
await browser.close()
```

更多内容可进一步探索