class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.text     :name               #机构名称
      t.string   :city               #城市
      t.string   :short_name         #简称
      t.text     :intro              #简介
      t.text     :desc               #介绍
      t.string   :website            #网站
      t.string   :address            #地址
      t.string   :contact_name       #联系人的姓名
      t.string   :contact_mobile     #联系人的电话，主要是为了审核的作用的。
      t.integer  :parent_id          #创建子下属机构
      t.string   :lft                #
      t.string   :rgt                #参见：awesome_nested_set
      t.string   :depth              #
      t.integer  :children_count     #
      t.integer  :position           #位置
      t.string   :status             #状态，新建|上线|下线
      t.timestamps null: false
    end
  end
end
