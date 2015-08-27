class CreatePermissionsRoles < ActiveRecord::Migration
  def change
    create_table :permissions_roles, id:  false do |t|
      t.belongs_to :permission
      t.belongs_to :role
      t.timestamps null: false
    end
    add_index :permissions_roles, [:role_id, :permission_id]
  end
end
