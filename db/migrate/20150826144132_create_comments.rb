class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer       :user_id              #回复人
      t.integer       :post_id              #回复的评价id
      t.text          :body                 #回复的内容
      t.text          :post_body            #回复的评价内容

      t.integer  :parent_id,        :null => true,  :index => true  #创建子评论
      t.integer  :lft,              :null => false, :index => true  # 参见 awesome_nested_set
      t.integer  :rgt,              :null => false, :index => true
      # optional fields
      t.integer  :depth,            :null => false, :default => 0 #深度
      t.integer  :children_count,   :null => false, :default => 0 #子节点数

      t.string        :status               #状态, 创建 | 删除
      t.timestamps null: false
    end
  end
end
