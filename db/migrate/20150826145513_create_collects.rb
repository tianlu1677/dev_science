class CreateCollects < ActiveRecord::Migration
  def change
    create_table :collects do |t|
      t.integer   :user_id            #收藏的人
      t.integer   :context_id         #收藏的具体事情
      t.string    :context_type       #收藏的具体事情类别
      t.string    :status             #收藏 | 取消收藏， online | offline
      t.timestamps null: false
    end
  end
end
