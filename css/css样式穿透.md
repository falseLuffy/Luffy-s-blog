# css第三方或全局样式穿透

组件
例如引用了组件el-dialog，该组件的class为el-dialog

```
<el-dialog class="myClass">
  其它内容
</el-dialog>
```

组件没有定义全局样式
```
<style scoped>
  .myClass /deep/ .el-dialog {
    margin-top: 0px !important;
  }
</style>
```
组件被定义了全局样式
例如定义了全局样式

```
.el-dialog{
  margin-top:8vh !important;
}
```
想要覆盖全局样式，就不能再写到scoped中，需要再写一个style，定义为全局，但是要注意这里的class千万不要与全局css文件中的相同

```
<style>
  .myClass  /deep/ .el-dialog {
    margin-top: 0px !important;
  }
</style>
```
关于 >>> 和 /deep/
有些像sass之类的预处理器，无法正确解析 >>>，此时可以使用 /deep/，它是 >>>的别名，同样可以起作用
