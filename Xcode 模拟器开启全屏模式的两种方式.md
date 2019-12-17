之前 Xcode 的模拟器不支持全屏模式，导致如果我们在 Xcode 全屏模式下编辑调试代码时，经常需要两个窗口来回切换。

从 Xcode 9 开始，模拟器也支持全屏模式了，可以在一个全屏窗口下同时打开 Xcode 和 Simulator，如图 1 所示。不过它默认是关闭的，我们可以通过如下两种方式开启。

* 方式一，在终端执行如下命令并重启模拟器即可：

defaults write com.apple.iphonesimulator AllowFullscreenMode -bool YES

* 方式二，在系统根目录下创建 /AppleInternal 目录：

（1）在终端执行 csrutil status 判断系统 SIP 状态，如果是已经关闭状态，则直接跳到第 3 步，否则通过如下步骤来关闭；
（2）重启 Mac 并按住 ⌘ CMD + R 直到进入 Recovery 模式，然后在屏幕上方菜单栏中找到“实用工具”，打开终端并执行 csrutil disable，最后重启 Mac，确认 SIP 已成功关闭；
（3）在终端执行 sudo mkdir /AppleInternal，如果出现 Operation not permitted 错误，请检查系统 SIP 状态是否关闭；
（4）打开 Xcode 模拟器，就可以在其菜单栏看到一个新的 Internal 选项，如图 2 所示，我们需要勾选 Allow Fullscreen Mode。

最后，通过上述方式开启模拟器的全屏模式后，我们就可把模拟器与 Xcode 拖拽到同一个全屏窗口了。

[参考链接](https://dev.to/zdnk/-fullscreen-xcode-and-simulator-42ng)

更多知识查看: [链接](https://github.com/awesome-tips/iOS-Tips)