class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer     :context_id
      t.string      :context_type
      t.integer     :user_id        #发起人
      t.text        :title          #主题的标题
      t.text        :body           #主题的内容
      t.integer     :views_count    #浏览数
      t.integer     :posts_count    #回复数
      t.integer     :position       #位置
      t.string      :status         #状态  上线 | 下线，结束讨论，置顶
      t.timestamps null: false
    end
  end
end
