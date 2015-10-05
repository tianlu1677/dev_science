class CreateOrganizationsUsers < ActiveRecord::Migration
  def change
    create_table :organizations_users do |t|
      t.integer     :user_id
      t.integer     :organization_id      #机构名称
      t.text        :desc                 #申请加入群组的简单描述，用于写明自己是谁，为什么加入
      t.datetime    :apply_at             #申请时间，主要为了更清晰的标识时间
      t.text        :reject_reason        #拒绝原因
      t.datetime    :reject_at            #拒接时间
      t.integer     :reject_user_id       #拒绝人的ID
      t.string      :status               # 审核, 审核通过，取消资格，new | online | offline
      t.string      :role_type
      t.string      :role_id
      t.timestamps null: false
    end
  end
end
