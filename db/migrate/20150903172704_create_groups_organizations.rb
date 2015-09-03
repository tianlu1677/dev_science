class CreateGroupsOrganizations < ActiveRecord::Migration
  def change
    create_table :groups_organizations do |t|
      t.integer     :group_id
      t.integer     :organization_id      #机构名称
      t.text        :desc                 #申请加入机构的简单描述，用于写明自己是谁，为什么加入
      t.datetime    :apply_at             #申请时间，主要为了更清晰的标识时间
      t.text        :reject_reason        #拒绝原因
      t.datetime    :reject_at            #拒接时间
      t.string      :status               # 审核, 审核通过，取消资格，new | online | offline
      t.timestamps null: false
    end
  end
end
