# mysql 学习记录

## 基本语句
### 子句
- select * from *
- limit 3,5  
- order by dasc | asc
- where name = 10  注：和order by 混用时，应在order by之后

|操作符|-说明-|
| -- | -- |
| = | 等于|
| <> | 不等于|
| != | 不等于|
| < | 小于|
| <= | 小于等于|
| > | 大于|
| >= | 大于等于|
| between * and * | 在指定两个值之间|
| is null | null 值判断|

- AND | OR  WHERE age = 1 OR WHERE age = 12
- 计算次序  ADN优先级高于 OR 可以使用() 括号主动设定优先级
- IN 用来指定条件范 围，范围中的每个条件都可以进行匹配
- NOT 
- LIKE 操作副
- 通配符 

| 通配符 | 说明 |
|--|--|
|%| 匹配任意多个任意字符|
|_(下划线)|一个任意字符|

- 正则表达式  REGEXP  与JavaScript的正则有些许差异。

|字符类|说明|
|--|--|
| [:alnum:]|任意字母和数字(同[a-zA-Z0-9])|
| [:alpha:]| 任意字符(同[a-zA-Z])|
| [:blank:]|空格和制表(同[\\t])|
| [:cntrl:]|ASCII控制字符(ASCII 0到31和127) |
| [:digit:]|任意数字(同[0-9])|
| [:graph:]| 与[:print:]相同，但不包括空格|
| [:lower:]| 任意小写字母(同[a-z])|
| [:print:]|任意可打印字符 |
| [:punct:]|既不在[:alnum:]又不在[:cntrl:]中的任意字符|
| [:space:]|包括空格在内的任意空白字符(同[\\f\\n\\r\\t\\v])|
| [:upper:]|任意大写字母(同[A-Z])|
| [:xdigit:]|任意十六进制数字(同[a-fA-F0-9])|

重复元字符

|元字符|说明|
|--|--|
|*|0个或多个匹配|
|+|1个或多个匹配(等于{1,})|
|?|0个或1个匹配(等于{0,1})|
|{n}|指定数目的匹配|
|{n,}|不少于指定数目的匹配|
|{n,m}|匹配数目的范围(m不超过255)|

定位符元字符

|元字符|说明|
|--|--|
|^|文本的开始|
|$|文本的结尾|
|[[:<:]]|词的开始|
|[[:>:]]|词的结尾|
   

- 计算字段

- 别名 AS

## 函数
- 文本处理函数
- 数值运算函数
- 处理日期的函数
- 返回系统信息的函数

### 文本处理函数

|函数名|说明|
|--|--|
|Left|返回串左边的字符|
|length|返回串的长度|
|Locate|找出串的一个子串|
|Lower|将串转为小写|
|LTrim|去掉左边的空格|
|Right|返回串右边的字符|
|RTrim|去掉右边的空格|
|Soundex|返回串的SOUNDX值|
|SubString|返回子串的字符|
|Upper|将串转为大写|
|Trim|去除左右两边的空格|

### 日期处理函数
|函数名|说明|
|--|--|
|AddDate()|增加一个日期(天、周等)|
|AddTime()|增加一个时间(时、分等)|
|CurDate()|返回当前日期|
|CurTime()|返回当前时间|
|Date()|返回日期时间的日期部分|
|DateDiff()|计算两个日期之差|
|Date_Add()|高度灵活的日期运算函数|
|Date_Format()|返回一个格式化的日期或时间串|
|Day()|返回一个日期的天数部分|
|DayOfWeek()|对于一个日期，返回对应的星期几|
|Hour()|返回一个时间的小时部分|
|Minute()|返回一个时间的分钟部分|
|Month()|返回一个日期的月份部分|
|Now()|返回当前日期和时间|
|Second()|返回一个时间的秒部分|
|Time()|返回一个日期时间的时间部分|
|Year()|返回一个日期的年份部分|

### 数值处理函数

|函数名|说明|
|--|--|
|Abs()| 返回一个数的绝对值|
|Cos()| 返回一个角度的余弦|
|Exp()| 返回一个数的指数值|
|Mod()| 返回除操作的余数|
|Pi()| 返回圆周率|
|Rand()| 返回一个随机数|
|Sin()| 返回一个角度的正弦|
|Sqrt()| 返回一个数的平方根|
|Tan()| 返回一个角度的正切|

##  聚集函数

|函数名|说明|
|--|--|
|AVG() |返回某列的平均值|
|COUNT()| 返回某列的行数|
|MAX() |返回某列的最大值|
|MIN() |返回某列的最小值|
|SUM()| 返回某列值之和|

示例：
```
SELECT AVG(pro_price) AS avg_price FROM products;
SELECT COUNT(pro_price) AS count_price FROM products;
SELECT MAX(pro_price) AS max_price FROM products;
SELECT MIN(pro_price) AS min_price FROM products;
SELECT SUM(pro_price) AS sum_price FROM products;
```

### 聚集不同值

```
SELECT COUNT(DISTINCT pro_price) AS count_price FROM products;
```

### 组合聚集函数

```
SELECT AVG(pro_price) AS avg_price,
       COUNT(pro_price) AS count_price，
       MAX(pro_price) AS max_price,
       MIN(pro_price) AS min_price,
       SUM(pro_price) AS sum_price
FROM products;
```

## 分组数据
###  数据分组

```
SELECT vend_id, COUNT(*) AS num_prods FROM products GROUP BY vend_id;
```