Vue3 学习心得 


Vue3 最新的特点是增加了组合式API，相比于组合式API ，还要其他的API需要我们了解，今天我们全面的了解一下

## 应用API 
## 全局API
## 选项API
## 组合式API
## 相应式API

踩坑经历  
vite 

不支持require 


## 差异

| 功能 | Vue3 | Vue2 |
| ---  | ---  | ---  |
|构造函数| 否| 是|
|插槽|slot="name"|#name|

## vue3 typescript JSX  组件开发及使用

prop 类型推导 PropType


### 函数组件 
    vue3 函数组件是无状态的，
    在jsx中使用函数组件是请使用如果时根组件请使用<></>包裹，否则函数组件将混淆父组件的props。



