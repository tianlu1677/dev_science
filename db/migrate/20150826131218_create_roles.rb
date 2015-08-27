class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name          #角色名称
      t.text   :desc          #角色描述
      t.timestamps null: false
    end
  end
end
