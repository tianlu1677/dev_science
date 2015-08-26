#users
# 用户表

string  :name,               null: false  #真实姓名
string  :email,              null: false  #email
string  :mobile,                          #手机号
string  :encrypted_password, null: false  #加密后的密码

Recoverable
string   :reset_password_token #重置密码
datetime :reset_password_sent_at #重置密码发送时间

 Rememberable
datetime :remember_created_at  #记住我

 Trackable
integer  :sign_in_count, default: 0, null: false #登录次数
datetime :current_sign_in_at      #当前登录时间
datetime :last_sign_in_at         #最近一次登录时间
inet     :current_sign_in_ip     #当前登录ip
inet     :last_sign_in_ip       #最近登录ip

 Confirmable
string   :confirmation_token      # 确认标识，用于发送邮件
datetime :confirmed_at            # 确认该邮件是该用户时间，
datetime :confirmation_sent_at    # 确认发送时间
string   :unconfirmed_email # Only if using reconfirmable #未验证的邮箱

 Lockable
t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
t.string   :unlock_token # Only if unlock strategy is :email or :both
t.datetime :locked_at

#profiles
个人信息
id:
user_id:
avatar:
city:
qq_account:
weibo_account:
education:



#roles
#角色
id
string :name #角色名称
datetime :created_at
datetime :update_at



#permissions
id
name: #权限的名称
action:           #动作
subject_name     #模块的名称
subject_id
subject_class    #模块的类名
created_at       #创建时间
updated_at       #更新时间


#roles_users
id:
user_id:
role_id

#permissions_roles
id:
role_id:
permission_id:


