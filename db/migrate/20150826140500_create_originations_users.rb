class CreateOriginationsUsers < ActiveRecord::Migration
  def change
    create_table :originations_users do |t|
      t.integer :user_id
      t.integer :organization_id #
      t.string  :status     # 审核, 审核通过，取消资格

      t.timestamps null: false
    end
  end
end
