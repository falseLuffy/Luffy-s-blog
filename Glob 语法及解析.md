
## Glob 语法

## 一、what  
一种匹配文件的类正则语法

## 二、glob 语法
|通配符|描述|例子|匹配|不匹配|
|--|--|--|--|--|
|*| 匹配任意数量的任何字符，包括无|Law*|Law, Laws, Lawyer | GrokLaw, La, aw|
|?|	匹配任何 单个 字符|	?at|Cat, cat, Bat, bat	|at|
|[abc]|	匹配括号中给出的一个字符 | [CB]at|	Cat, Bat	|cat, bat|
|[a-z]|	匹配括号中给出的范围中的一个字符|	Letter[0-9]|Letter0, Letter1 … Letter9 | Letters, Letter, Letter10
|[!abc]|匹配括号中未给出的一个字符 | [!C]at | Bat, bat, cat | Cat|
|[!a-z]|匹配不在括号内给定范围内的一个字符 |	Letter[!3-5]|Letter1…|Letter3 … Letter5, Letterxx

## 三、.gitignore 
最常见的使用场景就是 .gitignore 

git 的 .gitignore 文件可以使用 glob 模式匹配， 另外还有一些规则：

* 所有空行或者以 # 开头的行都会被 Git 忽略
* 匹配模式可以以 / 开头防止递归
* 匹配模式可以以 / 结尾指定目录
* 要忽略指定模式以外的文件或目录，可以在模式前加上惊叹号 ! 取反

## 四、类库

可以使用glob类库

```
npm install glob -S

import Glob from 'glob'

const files = glob(pattern [,options], cb)
const files = glob.async(pattern[, options])
const files = new glob.Glob(pattern[, options], cb)

```

[glob 库使用详情](https://www.npmjs.com/package/glob)