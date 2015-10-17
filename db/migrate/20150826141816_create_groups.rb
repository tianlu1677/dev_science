class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string  :name               #群组名称
      t.string  :short_name         #简称
      t.text    :intro              #简介
      t.text    :desc               #介绍
      t.string  :logo               #群组头像
      t.string  :website            #网站
      t.string  :privacy            #组织权限， 隐藏， 私密，公开, hidden, protected | public
      t.integer :position           #位置
      t.string  :status             #状态, 上线|下线 ， online | offline
      t.integer :super_admin_id     #小组管理员
      t.timestamps null: false
    end
  end
end
