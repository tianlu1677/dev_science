class CreateGroupsUsers < ActiveRecord::Migration
  def change
    create_table :groups_users do |t|
      t.integer     :group_id           #群组id
      t.integer     :user_id            #用户id
      t.integer     :role_id            #角色id
      t.string      :type               #角色的类别， owner | admin | member
      t.string      :status             #申请中 | 正式成员 | 移除了该组织 ， new | online | offline
      t.text        :desc               #申请加入机构的简单描述，用于写明自己是谁，为什么加入
      t.datetime    :apply_at           #申请时间，主要为了更清晰
      t.text        :reject_reason      #拒绝原因
      t.datetime    :reject_at          #拒绝时间
      t.integer     :reject_user_id     #拒绝人的ID
      t.string      :authority          #申请人的角色，分为 super_admin, admin, member
      t.timestamps null: false
    end
  end
end
