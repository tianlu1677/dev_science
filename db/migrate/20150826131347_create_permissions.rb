class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string  :name
      t.string  :subject_name
      t.string  :subject_class
      t.integer :subject_id
      t.string  :action
      t.text    :desc

      t.timestamps null: false
    end
  end
end
