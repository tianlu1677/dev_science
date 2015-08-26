class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer       :user_id              #回复人
      t.integer       :post_id              #回复的评价id
      t.text          :body                 #回复的内容
      t.text          :post_body            #回复的评价内容
      t.string        :status               #状态, 创建 | 删除
      t.timestamps null: false
    end
  end
end
