## 项目介绍

后端基于SpringBoot+MyBatis+SpringSecurity实现，实现的功能模块大致上分为以下几个
- 用户模块
- 安全模块
- 选择题
- 编程题  
  
 用户模块包含用户的注册、登录、修改用户信息等；安全模块使用SpringSecurity开发了基于JWT token的认证方式以及基于角色的授权，并且使用了全局的异常处理机制以及基于拦截器+注解实现的接口限流；实现了选择题的生成、校对、打分等功能；编程题模块实现了列表以及提交判断等功能。

## 项目截图
![enter image description here](http://img.sgxm.tech/01.PNG)
![enter image description here](http://img.sgxm.tech/02.PNG)
![enter image description here](http://img.sgxm.tech/03.PNG)
![enter image description here](http://img.sgxm.tech/03.PNG)
![enter image description here](http://img.sgxm.tech/05.PNG)
![enter image description here](http://img.sgxm.tech/06.PNG)
![enter image description here](http://img.sgxm.tech/07.PNG)
![enter image description here](http://img.sgxm.tech/08.PNG)
项目的演示地址为http://47.101.33.252 因为没有备案的服务器和域名。所以直接就是用IP了。该项目是前后端分离的，前端项目地址https://github.com/DeluxeZ/oj_web
## 技术选型
| 技术                 | 说明                | 官网                                                         |
| -------------------- | ------------------- | ------------------------------------------------------------ |
| SpringBoot           | 容器+MVC框架        | [https://spring.io/projects/spring-boot](https://spring.io/projects/spring-boot)|
| SpringSecurity           | 认证授权        | [https://spring.io/projects/spring-security](https://spring.io/projects/spring-security)|
| MyBatis              | ORM框架             | [http://www.mybatis.org/mybatis-3/zh/index.html](http://www.mybatis.org/mybatis-3/zh/index.html) |
| MyBatisGenerator     | 数据层代码生成      | [http://www.mybatis.org/generator/index.html](http://www.mybatis.org/generator/index.html) |
| PageHelper           | MyBatis物理分页插件 | [http://git.oschina.net/free/Mybatis_PageHelper](http://git.oschina.net/free/Mybatis_PageHelper) |
| Hibernator-Validator | 验证框架            | [http://hibernate.org/validator/](http://hibernate.org/validator/) |
| RabbitMq             | 消息队列            | [https://www.rabbitmq.com/](https://www.rabbitmq.com/)       |
| Redis                | 分布式缓存          | [https://redis.io/](https://redis.io/)                       |
| Lombok               | 简化对象封装工具    | [https://github.com/rzwitserloot/lombok](https://github.com/rzwitserloot/lombok) |
## 核心功能实现
- 注册
注册功能使用的是邮箱+激活链接的方式。这里是在用户的状态中使用一个bit表示激活状态，在用户注册的时候向数据库插入其用户信息但状态仍为未激活，往Redis中设置好对应的token后然后使用RabbitMQ异步发送消息，这里我是设置消费端为手动ACK模式，这样的话发送失败还可以将消息重新入队重新发送，可以设置一个阈值来控制重新发送的次数，因为只是发送激活邮件，幂等性以及100%消费这两个问题其实没必要考虑太多。
- 登录  
登陆其实跟普通的用户名、密码方式的登录差不太多，只不过这里我使用的是SpringSecurity+JWT的方式。
- 编程题提交
这里我也是参考的别人的思路，毕竟之前也没做过相应的功能。收到前端传过来的代码以及题目ID后，查询出数据库中对应的测试用例，这里Judge使用的是测试框架Junit+Hamcrest，基本做法将用户的代码生成一个Main.java的文件，然后后台页生成一个MainTest.java文章，这个MainTest类中调用Main类的实例并使用Junit来进行Judge，然后就是生成一个Linux下的shell脚本并调用这个脚本执行编译MainTest.java并执行MainTest，最后读取Linux'的标准输出并处理返回的结果。这是一个MainTest类的示例
![enter image description here](http://img.sgxm.tech/09.PNG)
- 选择题生成
因为我们的功能选择题是由答题的时间限制的，只使用数据库还是比较麻烦的，所以我使用的是Redis，实现起来很简单，就是调用的使用将随机生成的题目以及选项设置到Redis中，然后设置响应的过期时间。这里考虑一个场景，如果用户答题答到一半就掉线退出了，这个怎么处理呢。我的解决方式分为以下两种情况：
第一种情况是如果用户迅速的返回该题，并且题目还没有超时，则重新设置一下题目的过期时间，然后让他继续答题。(这个当然是有问题的)
第二种情况就是用户掉线，且题目也已经超时了。这里可以有两种方式解决，第一种是使用监听Redis的key过期事件，每当Redis种这道题目过期，就结束这个用户的答题(功能是只要答错一题就结束答题),这个可以实现一个Redis自动处理答题结果的效果。
第二种方式就是当用户掉线重连后，检测他次答题是不是超时了，如果超时了那就结算他上次答题的分数并返回，这种方式的实现比较简单，而且因为我们没有让用户查看往期答题记录的功能，所以也比较人性化。
## 环境搭建
环境的部署比较简单，因为毕竟只是一个单体项目。首先这个项目只能部署在linux上，如果使用Windows的话，OJ提交的接口就用不了了。
首先在application.yml种填好你对应的中间件、邮箱服务以及数据源的信息，然后在EmailConst中修改对应的邮件激活链接的地址，然后打包部署即可。
