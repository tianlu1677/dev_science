class CreateRolesUsers < ActiveRecord::Migration
  def change
    create_table :roles_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :role
      t.timestamps null: false
    end
    add_index :roles_users, [:user_id, :role_id]

  end
end
