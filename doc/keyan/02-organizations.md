
# organizations  机构

id:
name:               #机构名称
city:               #城市
short_name:         #简称
intro:              #简介
desc:               #介绍
website:            #网站
address:            #地址
contact_name:       #联系人的姓名
contact_mobile:     #联系人的电话，主要是为了审核的作用的。

parent_id:          #创建子下属机构
lft:                #
rgt:                #参见：awesome_nested_set
depth:              #
children_count:     #

position:           #位置
status:             #状态，新建|上线|下线

#organizations_users
id:
user_id:
organization_id:
status: 审核, 审核通过，取消资格

#groups 组织

id:
name:               #机构名称
short_name:         #简称
intro:              #简介
desc:               #介绍
website:            #网站
privacy:            #组织权限， 隐藏， 私密，公开, hidden, protected | public

position:           #位置
status:             #状态, 上线|下线 ， online | offline

                    #如何邀请别人加入到该组织？
## 待定 invitation_codes 邀请码，这种是点击链接就可以申请，还是通过发送邮件的方式来？
## 可以借助devise_invitable 来实现邮件发送邀请
## 先采用url的方式
id:
group_id:         #群组的名称
code:             #邀请码
timeout:          #过期时间，一般为3天
status:           #邀请码的状态，可用|过期，管理员可直接过期， online | offline
created_at:       #创建时间开始算起
updated_at:


#组织与用户之间的关联表
groups_users
id:
group_id:     #群组id
user_id:      #用户id
role_id:      #角色id
type:         #角色的类别， owner | admin | member
status:       # 申请中 | 正式成员 | 移除了该组织 ， new | online | offline


#articles
#文章，这个文章是干什么用的呢？

id:
user_id:
title:
body:
created_at:
updated_at:

# topics
# 主题： 这个一般用在群组里面发的主题
id:
title:          #主题的标题
body:           #主题的内容
context_id:
context_type:
user_id:        #发起人
views_count:    #浏览数
posts_count:    #回复数
position:       #位置
status:         #状态  上线 | 下线
created_at:
updated_at:

# posts 评论
id:
body:                 #评价的内容
user_id:              #评论人
context_id:           #评论的是什么的id
context_type:         #评论的是什么的类别
status:               #状态, 创建 | 删除，从数据库删除
created_at:
updated_at:

#comments 评论的回复
id:
body:                 #回复的内容
user_id:              #回复人
post_id:              #回复的评价id
post_body:            #回复的评价内容
status:               #状态, 创建 | 删除
created_at:
updated_at:


#收藏
collects
id:
user_id:            #收藏的人
context_id:         #收藏的具体事情
context_type:       #收藏的具体事情类别
status:             #收藏 | 取消收藏， online | offline
created_at:
updated_at:

#关注，这个实现通知吗,如果一有更新的内容就通知用户
attentions
id:
user_id:          #关注的人
context_id:       #关注的具体事情
context_type:     #关注的具体事情的类别
accept_update:    #接受更新，online | offline
status:           #关注 | 取消关注, online | offline
created_at:
updated_at:

#文件存储
assets

id:
context_id:        #文件的所属
context_type:      #
title              #文件的名称
width              #图片的宽
height             #图片的高
file_size          #文件大小
file_type          #文件的类别，ppt,xls 之类的
file_name          #文件原名称
link               #文件链接
pdf_link           #pdf文件预览
position           #位置
status             #状态
uuid               #唯一标识符

#tag  标签
#tagging  标签的类别,借助于  tag gem

# versions 版本控制
# 这个借助于  paper_tail

#分类的功能

#categories 分类，这里用在哪里好？


