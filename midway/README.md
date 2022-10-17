# midway 踩坑经历了

midway 是采用node编写的服务端框架

serveless 现在一个潮流


serverless 本地文件系统是readonly 如果想使用文件系统，可以借用日志目录短暂使用。

对FormData 格式取值使用Field

## 走过 Midway 的路
midway是一个使用JavaScript/Typescript开发的，借鉴Java Spring 框架的服务端框架,是JS开发者从事后端功能开发的很好的工具，也是前端开发人员接触后端开发的很好的工具。

注意：当前Midway 分2.x和3.x版，如需使用相关插件请注意版本适配，否则可能会有构建和发布失败的情形。

[Midway 开发文档](https://midway.alibaba-inc.com/docs/next/ali_node/quickstart)

本文只记录开发使用Midway开发的一些心得和感悟，具体Midway的使用请参开文档

## 获取参数
Midway常用装饰器获取路由参数
## 常用的装饰器

## 请求方法装饰器
| 装饰器 | 作用 |
|   --  |   -- |
|@Get|get方法|
|@Post|post方法|
|@Delete|delete|
|@Put|put方法|
|@All|全路由|
|...|

### 获取参数的装饰器
| 装饰器 | 作用 |
|   --  |   -- |
|@Query|获取地址query信息|
|@Body | 获取post body内信息|
|@Fields | 获取post请求FormData信息|
|@Param | 获取地址params信息|
|@file | 获取formData 中第一个文件|
|@files | 获取formData中所有文件|
|@Header | 获取请求头信息|
|@Cookie | 获取请求cookie信息|
|@Session | 获取请求session|
|...|

### 修改响应头修饰器
| 装饰器 | 作用 |
|   --  |   -- |
|@Redict|修改相应条状|
|@HttpCode|修改相应状态码|
|@SetHeader|修改相应头|
|@ContentType|修改相应头中的Content-Type|
|...|
### 微服务
| 装饰器 | 作用 |
|   --  |   -- |
|@Provider|微服务的提供者|
|@Consumer|微服务的消费者|
|serverless|
|ServerlessTrigger|函数触发器|
### 分布式|
| 装饰器 | 作用 |
|   --  |   -- |
|@Task|定义一个分布式任务|
|@TaskLocal|定义一个本地任务|
### 自动|
| 装饰器 | 作用 |
|   --  |   -- |
|@Schedule|标识一个egg定时任务|
|@Queue|定义一个自触发的任务|


## 依赖注入的三种作用域
- 1、请求作用域
- 2、单例作用域
- 3、原型作用域

请求作用域是默认作用域，生命周期绑定请求链路，实例在请求链路上唯一，请求结束立即销毁，是一个动态的作用域，一般使用在接口请求的服务上，可方便的使用作用域ctx上的信息。单例作用域全局唯一，可做全局初始化的服务，但是无法获取ctx相关信息。

- 4、作用域降级

如果请求作用域类被注入到单例作用域中，请求作用域会产生作用域降级，请求作用域会降级会单例作用域，导致无法获取ctx相关信息， 例如在中间件中注入服务。可以使用动态的获取方式，使得作用域统一

```
import { IMiddleware } from '@midwayjs/core';
import { Middleware } from '@midwayjs/decorator';
import { NextFunction, Context } from '@midwayjs/koa';

@Middleware()
export class ReportMiddleware implements IMiddleware<Context, NextFunction> {

  resolve() {
    return async (ctx: Context, next: NextFunction) => {
      const userService = await ctx.requestContext.getAsync(UserService);
      // TODO userService.xxxx
      await next();
    };
  }
}
```

## 自定义

Midway 支持丰富的自定义功能

- 1、扩展上下文自定义
- 2、自定义组件
- 2、自定义装饰器、
- 4、自定义错误
- 5、修改源码目录
