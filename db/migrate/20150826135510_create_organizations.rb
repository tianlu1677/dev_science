class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string   :name               #机构名称
      t.string   :city               #城市
      t.string   :short_name         #简称
      t.string   :logo               #机构标志
      t.text     :intro              #简介
      t.text     :desc               #介绍
      t.string   :website            #网站
      t.string   :address            #地址
      t.string   :contact_name       #联系人的姓名
      t.string   :contact_mobile     #联系人的电话，主要是为了审核的作用的。

      t.integer  :parent_id,        :null => true, :index => true  #创建下属机构
      t.integer  :lft,              :null => false, :index => true  # 参见 awesome_nested_set
      t.integer  :rgt,              :null => false, :index => true
      # optional fields
      t.integer  :depth,            :null => false, :default => 0 #深度
      t.integer  :children_count,   :null => false, :default => 0 #子节点数

      t.integer  :position           #位置
      t.string   :status             #状态，新建|上线|下线
      t.timestamps null: false
    end
  end
end
