class CreateGroupsUsers < ActiveRecord::Migration
  def change
    create_table :groups_users do |t|
      t.string     :group_id     #群组id
      t.string     :user_id      #用户id
      t.string     :role_id      #角色id
      t.string     :type         #角色的类别， owner | admin | member
      t.string     :status        #申请中 | 正式成员 | 移除了该组织 ， new | online | offline
      t.timestamps null: false
    end
  end
end
