class CreateAttentions < ActiveRecord::Migration
  def change
    create_table :attentions do |t|
      t.integer   :user_id          #关注的人
      t.integer   :context_id       #关注的具体事情
      t.string    :context_type     #关注的具体事情的类别
      t.string    :accept_update    #接受更新，online | offline
      t.string    :status           #关注 | 取消关注, online | offline

      t.timestamps null: false
    end
  end
end
