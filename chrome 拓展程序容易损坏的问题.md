# chrome 拓展程序容易损坏的问题

原因： 为了防止扩展程式被病毒木马或恶意软件修改，Chrome的扩展程序安全验证机制， 会比对本地扩展和Chrome商店中的扩展是否一致，如不匹配就会出现这个错误。

1、尝试修复扩展程序
打开扩展程序，按"修复"按钮，让Chrome尝试修复损坏的扩展程序。Chrome会从Chrome商店重新安装该扩展程序。

2、调整扩展程序内容验证模式
如果上述方法没有效果，可以尝试调整扩展程序内容验证模式。在Chrome浏览器地址输入框中输入：chrome://flags/#extension-content-verification，进入扩展程序内容验证设定，将下拉框中的"严格强制实施模式"(Enforce strict) 或"强制实施模式" 改为"引导模式"(Bootstrap)，重启确认问题是否存在。

参考：[chrome 拓展程序容易损坏问题修复](https://www.xiaoyuanjiu.com/9700.html)