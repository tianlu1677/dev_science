Focus on science!

### 系统依赖：

* ruby 2.2.1
* rails 4.2.3
* minimagic
* postgresql

### 增加数据库与全局的配置文件
```ruby
cp config/database.example.yml config/database.yml
cp config/settings.example.yml config/settings.yml

bundle install
```
### 数据庫
```
rake db:drop & rake db:create & rake db:migrate & rake db:seed
```

### 启动
```
rails s -p 3000
```
访问 ` http://localhost:3000 `

### 登陆

使用测试账户, 邮箱：  xiaoming@qq.com  密码： 12345678
