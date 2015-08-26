class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string  :name,              null: false  # 真实姓名
      t.string  :mobile
      t.string  :avatar
      t.string  :city
      t.string  :country
      t.string  :qq
      t.string  :weibo
      t.string  :wechat
      t.timestamps null: false
    end
  end
end
