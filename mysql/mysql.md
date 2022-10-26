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

## 分组数据 GROUP BY
###  数据分组

```
SELECT vend_id, COUNT(*) AS num_prods FROM products GROUP BY vend_id;
```

分组和排序的思辨

GROUP BY 和ORDER BY 功能有类似部分，但是两者有很大的差异，要区分使用

SELECT子句顺序

### SELECT子句及其顺序

|子句|说明|是否必须使用|
|--|--|--|
|SELECT|要返回的列或表达式|是|
|FROM   |从中检索数据的表|仅在从表选择数据时使用|
|WHERE   |行级过滤|否|
|GROUP BY|分组说明 |仅在按组计算聚集时使用|
|HAVING| 组级过滤 |否|
|ORDER BY|输出排序顺序| 否|
|LIMIT|要检索的行数| 否|


### 子查询
```
SELECT pro_name FROM products
    WHERE user_id IN (SELECT user_id FORM users WHERE user_id = 100)

SELECT cust_name, cust_state, (SELECT COUNT(*) FROM orders WHERE orders.cust_id = customers.cust_id) AS orders 
    FROM customers ORDER BY cust_name
```


## 联结
为什么要用联结

如何使用联结
```
SELECT cust_name, pro_name FROM users, products WHERE users.id = product.user_id
```

- 内部联结
- 自联结
- 自然联结
- 外部联结

示例：
```
//内联结
//自联结
//自然联结
//外部联结
//联结中使用聚集函数
```

## 组合查询
    - UNION
    - UNION ALL
    - 排序 ORDER BY  最后一条 SELECT语句使用

```
SELECT vend_id, prod_id, prod_price FROM products WHERE product_price <= 5
UNION
SELECT vend_id, prod_id, prod_price FROM products WHERE vend_id IN (1001, 1002);
```
注意： UNION 使用规则 ：

    - 1
    - 2
    - 3


- INSERT 
- INSERT SELECT

- UPDATE
- DELETE 
注意： 使用时需带着WHERE 否则将更新或删除表中所有数据
- ALTER TABLE 更新表
- DROP TABLE
- RENAME TABLE


## 视图
    - CREATE VIEW
    - SHOW CREATE VIEW viewname
    - DROP VIEW
    - CREATE OR REPLACE VIEW
### 功能
    - 简化SQL语句
    - 复用SQL
        - 重新格式化数据
        - 过滤数据
        - 复用计算字段
### 视图不能被更新的集中情况, 除了一下几种情况，都可以被更新
    1、分组
    2、联结
    3、子查询
    4、并
    5、聚集函数（Min()、Count()、Sum()）
    6、DISTINCT
    7、导出（计算）列
    注： 一般，应该将视图用于检索(SELECT语句) 而不用于更新(INSERT、UPDATE和DELETE)。


## 存储过程
    批量处理的一系列的SQL语句的集合

### 为什么使用
    简单、安全、高效
    难度大、需要管理员权限

创建存储过程

    CREATE PROCEDURE productProcing() 
    BEGIN
        SELECT Avg(prod_price) AS priceaverage
        FROM  products;
    END;

调用存储过程

    CALL productProcing()
    
删除存储过程

    DROP PROCEDURE productProcing;
## 游标

    申明-DECLARE
    打开-OPEN
    读取- FETCH
    关闭-CLOSE

## 触发器

使用场景
    每当增加一个顾客到某个数据库表时，都检查其电话号码格式是 否正确，州的缩写是否为大写;
    每当订购一个产品时，都从库存数量中减去订购的数量; 
    无论何时删除一行，都在某个存档表中保留一个副本。

触发器列表

|种类|说明|
|--|--|
|INSERT|插入触发器|
|UPDATE|更新触发器|
|DELETE |删除触发器|

创建触发器
```
CREATE TRIGGER newproduct AFTER INSERT ON products FOR  EACH ROW SELECT 'Product added';

CREATE TRIGGER newproduct AFTER DELETE ON products FOR  EACH ROW SELECT 'Product added';

CREATE TRIGGER newproduct AFTER UPDATE ON products FOR  EACH ROW SELECT 'Product added';

```
删除触发器
```
DELETE TRIGGER newproduct;
```

## 事务处理

    可以用来维护数据库的完整性，它 保证成批的MySQL操作要么完全执行，要么完全不执行。

```
START TRANSACTION
DELETE FROM orderitems WHERE order_num = 20010;
DELETE FROM orders WHERE order_num = 20010;
COMMIT
```

保留点
```
SAVEPOINT delete1;
ROLLBACK TO delete1;
```

更改默认的提交行为
```
SET autocommit=0;
```

## 字符集管理

## 安全和用户管理

## 数据库维护
### 备份数据
|名称|说明|
|--|--|
|mysqldump|转储所有数据库内容到某个外部 文件|
|mysqlhotcopy|从一个数据库复制所有数据|
|BACKUP TABLE|转储所 有数据到某个外部文件|
|SELECT INTO OUTFILE|转储所 有数据到某个外部文件|
|FLUSH TABLES|刷新数据库，确保当前无缓存数据|
### 数据库维护

|名称|说明|
|--|--|
|ANALYZE TABLE||
|CHECK TABLE||

### 问题诊断
mysqld

### 日志文件管理

|日志种类|说明|
|--|--|
|错误日志|hostname.err 它包含启动和关闭问题以及任意关键错误的细节|
|查询日志|hostname.log 记录所有MySQL活动，在诊断问题时非常有用|
|二进制日志|hostname-bin 它记录更新过数据(或者可能更新过数据)的所有 语句|
|缓慢查询日志| hostname-slow.log 此日志记录执行缓慢的任何查询|

## 数据格式

|数据类型|说明|
|--|--|
|串数据类型||
|数值数据类型||
|日期和时间数据类型||
|二进制数据类型||