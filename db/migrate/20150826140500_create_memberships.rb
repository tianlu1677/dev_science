class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer     :manageable_id        #所隶属的机构 | 群组
      t.string      :manageable_type       # 类型
      t.integer     :memberable_id        # 被控制的对象, 如加入机构的人，加入群组的人
      t.string      :memberable_type      #
      t.text        :desc                 #申请加入群组的简单描述，用于写明自己是谁，为什么加入
      t.datetime    :apply_at             #申请时间，主要为了更清晰的标识时间
      t.text        :reject_reason        #拒绝原因
      t.datetime    :reject_at            #拒接时间
      t.integer     :last_user_id         #最后修改人的id
      t.string      :status               # 审核, 审核通过，取消资格，new | online | offline
      t.string      :role_type            # 表明所属的角色
      t.string      :role_id              # 所属角色的id
      t.string      :join_type            # 自己主动加入，邀请加入，被加入
      t.timestamps null: false
    end
  end
end
