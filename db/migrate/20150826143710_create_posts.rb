class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer     :user_id              #评论人
      t.string      :body                 #评价的内容
      t.integer     :postable_id           #评论的是什么的id
      t.string      :postable_type         #评论的是什么的类别
      t.string      :status               #状态, 创建 | 删除除，从数据库删除
      t.timestamps null: false
    end
  end
end
