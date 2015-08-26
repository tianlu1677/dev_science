class CreateInvitationCodes < ActiveRecord::Migration
  def change
    create_table :invitation_codes do |t|
      t.string :group_id         #群组的名称
      t.string :code             #邀请码
      t.string :timeout          #过期时间，一般为3天
      t.string :status           #邀请码的状态，可用|过期，管理员可直接过期， online | offline
      t.text   :url
      t.timestamps null: false
    end
  end
end
